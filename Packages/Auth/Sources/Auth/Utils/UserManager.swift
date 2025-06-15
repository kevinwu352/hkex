//
//  UserManager.swift
//  Auth
//
//  Created by Kevin Wu on 5/10/25.
//

import Foundation
import Design

@Observable
public final class UserManager: UserManaging {
    public init(user: User) {
        print("[life] usermg init [\(user.username)]")
        self.user = user
    }
    deinit { print("[life] usermg deinit") }

    public var user: User

    public func changePhone(_ phone: String) {
    }

}
// extension UserManager: @preconcurrency CustomStringConvertible {
//     public var description: String {
//         "usermg [\(user.username)]"
//     }
// }
