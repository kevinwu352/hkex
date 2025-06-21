//
//  MarketTests.swift
//  Market
//
//  Created by Kevin Wu on 6/21/25.
//

import Testing
@testable import Market

struct Test {

    @MainActor
    @Test func testPlus() {
        #expect(plus(1, 2) == 3)
        #expect(plus(2, 2) == 4)
    }

}
