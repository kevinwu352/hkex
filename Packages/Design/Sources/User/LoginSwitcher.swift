//
//  LoginSwitcher.swift
//  Design
//
//  Created by Kevin Wu on 4/29/25.
//

import Foundation
import Factory

public extension Container {
    @MainActor
    var switcher: Factory<LoginSwitching> {
        self { @MainActor in LoginSwitcher() }.cached
    }
}

@MainActor
public protocol LoginSwitching: Sendable {
    var current: User? { get }
    var channel: AsyncStream<User?> { get }

    func loadSavedUser()
    func loggedIn(user: User)
    func loggedOut()
}

final class LoginSwitcher: LoginSwitching {

    private let secures = Container.shared.secures()
    init() {
        // print("[life] switcher init")
        loadSavedUser()
    }
    // deinit { print("[life] switcher deinit") }

    @Published private var object: User?

    var current: User? {
        object
    }
    var channel: AsyncStream<User?> {
        AsyncStream { continuation in
            Task {
                for await value in $object.values {
                    continuation.yield(value)
                }
            }
        }
    }

    func loadSavedUser() {
        if let username = secures.lastUsername, !username.isEmpty,
           let token = secures.accessToken, !token.isEmpty {
            let user = User.load(username: username, token: token)
            object = user
        }
    }
    func loggedIn(user: User) {
        if !user.username.isEmpty && !user.token.isEmpty {
            secures.lastUsername = user.username
            secures.accessToken = user.token
            user.save()
            object = user
        }
    }
    func loggedOut() {
        secures.lastUsername = nil
        secures.accessToken = nil
        object = nil
    }

}
