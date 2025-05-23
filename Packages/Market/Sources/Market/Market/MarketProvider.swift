//
//  MarketProvider.swift
//  Market
//
//  Created by Kevin Wu on 5/3/25.
//

import Foundation
import Design
import Factory

protocol MarketProviding: Sendable {
    func getPosts() async throws -> Posts
}

final class MarketProvider: MarketProviding {
    let network = Container.shared.network()

    func getPosts() async throws -> Posts {
        let list = try await network.request(Api.getPosts(), type: Posts.self)
        return list
    }

}
