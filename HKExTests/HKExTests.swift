//
//  HKExTests.swift
//  HKExTests
//
//  Created by Kevin Wu on 6/21/25.
//

import Testing
@testable import HKEx

struct Test {

    @Test func testMinus() {
        #expect(minus(2, 1) == 1)
        #expect(minus(3, 1) == 2)
    }

}
