//
//  LoginViewModel.swift
//  Auth
//
//  Created by Kevin Wu on 4/29/25.
//

import SwiftUI
import Design

@MainActor
@Observable
final class LoginViewModel {
    let provider: LoginProviding
    init(provider: LoginProviding) {
        self.provider = provider
        print("login vm init")
    }
    deinit { print("login vm deinit") }

    func login(id: Int) async {
        print("login vm login")
        let user = try? await provider.login(id: id)
        if let user = user {
            await provider.changeToLoggedIn(user: user)
        }
    }

}
