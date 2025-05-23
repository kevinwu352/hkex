//
//  HTTPClient.swift
//  Design
//
//  Created by Kevin Wu on 4/22/25.
//

import Foundation
import Combine

public final class HTTPClient {
    let host: String
    let headers: [String: String]
    let session: URLSession

    public init(host: String, headers: [String: String], session: URLSession) {
        self.host = host
        self.headers = headers
        self.session = session
    }
    // deinit { print("[life] network deinit") }
}

public extension HTTPClient {
    convenience init(token: String? = nil) {
        // print("[life] network init [\(token ?? "")]")
        let host = "run.mocky.io"

        var headers: [String: String] = [:]
        headers["token"] = token

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        config.httpMaximumConnectionsPerHost = 8
        let session = URLSession(configuration: config)

        self.init(host: host, headers: headers, session: session)
    }
}

// extension HTTPClient: CustomStringConvertible {
//     public var description: String {
//         "network [\(headers["token"] ?? "")]"
//     }
// }

public protocol Networkable: Sendable {
    func request<T: Decodable>(_ endpoint: Endpoint, type: T.Type, completion: @escaping @Sendable (Result<T, ReqError>) -> Void)
    func request<T: Decodable>(_ endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, ReqError>
    func request<T: Decodable>(_ endpoint: Endpoint, type: T.Type) async throws(ReqError) -> T
}

extension HTTPClient: Networkable {
    public func request<T: Decodable>(_ endpoint: Endpoint, type: T.Type, completion: @escaping @Sendable (Result<T, ReqError>) -> Void) {
        do {
            let req = try endpoint.req(host, headers)
            let task = session.dataTask(with: req) { data, response, error in
                guard error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                    completion(.failure(.codeError))
                    return
                }
                guard let data = data, !data.isEmpty else {
                    completion(.failure(.dataError))
                    return
                }
                guard let object = try? JSONDecoder().decode(T.self, from: data) else {
                    completion(.failure(.decodeError))
                    return
                }
                completion(.success(object))
            }
            task.resume()
        } catch {
            completion(.failure(error))
        }
    }

    public func request<T: Decodable>(_ endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, ReqError> {
        Just(endpoint)
            .tryMap { try $0.req(host, headers) }
            .flatMap {
                self.session.dataTaskPublisher(for: $0) // server error
                    .tryMap {
                        guard let response = $1 as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                            throw ReqError.codeError
                        }
                        guard !$0.isEmpty else {
                            throw ReqError.dataError
                        }
                        guard let object = try? JSONDecoder().decode(T.self, from: $0) else {
                            throw ReqError.decodeError
                        }
                        return object
                    }
            }
            .mapError { $0 as? ReqError ?? .serverError }
            .eraseToAnyPublisher()
    }

    public func request<T: Decodable>(_ endpoint: Endpoint, type: T.Type) async throws(ReqError) -> T {
        do {
            let req = try endpoint.req(host, headers)
            let (data, response) = try await session.data(for: req) // server error
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                throw ReqError.codeError
            }
            guard !data.isEmpty else {
                throw ReqError.dataError
            }
            guard let object = try? JSONDecoder().decode(T.self, from: data) else {
                throw ReqError.decodeError
            }
            return object
        } catch {
            throw error as? ReqError ?? .serverError
        }
    }
}
