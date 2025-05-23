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
        .init(path: "/v3/d09c8e3b-0247-45d6-8691-e3aeec2087fe", method: .get)
    }
}
