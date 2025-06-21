//
//  TestViewModel.swift
//  Wallet
//
//  Created by Kevin Wu on 6/21/25.
//

import Foundation

@MainActor
@Observable
class TestViewModel {
    var list = ["aaa", "bbb", "ccc"]

    func search(_ text: String?) -> [String] {
        if let text = text, !text.isEmpty {
            let text = text.lowercased()
            return list.filter { $0.lowercased().contains(text) }
        } else {
            return list
        }
    }
}
