//
//  LoginProvider.swift
//  Auth
//
//  Created by Kevin Wu on 5/1/25.
//

import Foundation
import Design
import Factory

protocol LoginProviding: Sendable {
    func login(id: Int) async throws -> User?
    func changeToLoggedIn(user: User) async
}

final class LoginProvider: LoginProviding {
    let network = Container.shared.network()

    func login(id: Int) async throws -> User? {
        let list = try await network.request(Api.login(), type: Users.self)
        if let user = list.first(where: { $0.id == id }) {
            return user
        }
        return nil
    }

    func changeToLoggedIn(user: User) async {
        await Container.shared.switcher().loggedIn(user: user)
    }

}
