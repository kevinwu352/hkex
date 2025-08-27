//
//  Api.swift
//  Market
//
//  Created by Kevin Wu on 5/3/25.
//

import Foundation
import Design

struct Api: Endpoint {
    var path: String
    var method: ReqMethod
    var parameters: [String: Encodable]?
    var encoding: ReqEncoding = .url
    var headers: [String: String]?
}

extension Api {
    // https://jsonplaceholder.typicode.com/posts
    static func getPosts() -> Self {
        .init(path: "/c/15d2-c889-4d9f-a053", method: .get)
    }
}
