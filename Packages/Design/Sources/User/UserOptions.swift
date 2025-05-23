//
//  UserOptions.swift
//  Design
//
//  Created by Kevin Wu on 4/28/25.
//

import Foundation
import Factory

public extension Container {
    @MainActor
    var options: Factory<UserOptions> {
        self { @MainActor in UserOptions(onDisk: true, user: "") }.cached
    }
}
public extension UserOptions {
    static var preview: UserOptions {
        UserOptions(onDisk: false, user: "")
    }
}

@MainActor
@Observable
public final class UserOptions {
    public let raw: Storage
    // let type: String
    public init(onDisk: Bool = true, user: String = "") {
        // type = onDisk ? user.isEmpty ? "shared" : user : "preview"
        // print("[life] options init [\(type)]")
        raw = Storage(path: onDisk ? pathmk("Preferences/options-user-\(user.isEmpty ? "shared" : user).json", nil) : "")

        accountBalanceMasked = raw.getBool("account_balance_masked") ?? false
    }
    // deinit { print("[life] options deinit") }

    public var accountBalanceMasked: Bool {
        willSet { raw.setBool(newValue, "account_balance_masked") }
    }
}

// extension UserOptions: @preconcurrency CustomStringConvertible {
//     public var description: String {
//         "options [\(type)]"
//     }
// }
