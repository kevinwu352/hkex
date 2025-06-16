//
//  TokenManager.swift
//  Wallet
//
//  Created by Kevin Wu on 6/21/25.
//

import Foundation
import Factory

// how to use user dependency
extension Container {
    @MainActor
    var tokenmg: Factory<TokenManager> {
        self { @MainActor in TokenManager(token: self.usermg().user.username) }.scope(.session)
    }
}

@Observable
final class TokenManager {
    var token: String
    init(token: String) {
        self.token = token
        print("[life] tokenmg init [\(token)]")
    }
    deinit { print("[life] tokenmg deinit [\(token)]") }
}

extension TokenManager: CustomStringConvertible {
    var description: String {
        "tokenmg [\(token)]"
    }
}
