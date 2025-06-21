//
//  WalletTests.swift
//  Wallet
//
//  Created by Kevin Wu on 6/21/25.
//

import Testing
@testable import Wallet

struct Test {

    @MainActor
    @Test func testSearch() {
        let vm = TestViewModel()
        let list = ["aaa", "bbb", "ccc"]
        #expect(vm.search(nil) == list)
        #expect(vm.search("") == list)
        #expect(vm.search("a") == ["aaa"])
        #expect(vm.search("d") == [])
    }

}
