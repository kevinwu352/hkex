//
//  UserManager.swift
//  Design
//
//  Created by Kevin Wu on 5/10/25.
//

import Foundation
import Factory

public extension Container {
    @MainActor
    var usermg: Factory<UserManaging> {
        self { @MainActor in UserManagerPh(user: .init()) }.scope(.session)
    }
}

@MainActor
public protocol UserManaging: Sendable {
    var user: User { get }

    func changePhone(_ phone: String)
}

@Observable
final class UserManagerPh: UserManaging {
    init(user: User) {
        print("[life] usermg init [mock]")
        self.user = user
    }
    deinit { print("[life] usermg deinit [mock]") }

    var user: User

    func changePhone(_ phone: String) {
    }

}
// extension UserManagerPh: @preconcurrency CustomStringConvertible {
//     var description: String {
//         "usermg [mock]"
//     }
// }
