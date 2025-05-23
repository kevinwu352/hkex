//
//  UserManaging.swift
//  Design
//
//  Created by Kevin Wu on 5/10/25.
//

import Foundation
import Factory

public extension Container {
    @MainActor
    var manager: Factory<UserManaging> {
        self { @MainActor in UserManagerPh(user: .init()) }.cached
    }
}

@MainActor
public protocol UserManaging: Sendable {
    var user: User { get }

    func changePhone(_ phone: String)
}

@Observable
public final class UserManagerPh: UserManaging {
    public init(user: User) {
        print("[life] manager init [mock]")
        self.user = user
    }
    deinit { print("[life] manager deinit [mock]") }

    public var user: User

    public func changePhone(_ phone: String) {
    }

}
// extension UserManagerPh: @preconcurrency CustomStringConvertible {
//     public var description: String {
//         "manager [mock]"
//     }
// }
