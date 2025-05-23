//
//  MarketViewModel.swift
//  Market
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI
import Design

@MainActor
@Observable
final class MarketViewModel {
    let provider: MarketProviding
    init(provider: MarketProviding) {
        self.provider = provider
        // print("market vm init \(dev_obj_addr(self))")
    }
    // deinit {
    //     print("market vm deinit \(dev_obj_addr(self))")
    // }

    var posts: Posts = []

    func getPosts() async {
        print("market vm get posts")
        let list = try? await provider.getPosts()
        posts = list ?? []
    }

    func plusId() {
        posts = posts.map {
            $0.setId($0.id + 100)
        }
    }
}
