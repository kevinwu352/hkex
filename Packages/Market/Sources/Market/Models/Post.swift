//
//  Post.swift
//  Market
//
//  Created by Kevin Wu on 5/3/25.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String

    func setId(_ id: Int) -> Self {
        .init(id: id,
              userId: userId,
              title: title,
              body: body
        )
    }
}

typealias Posts = [Post]
