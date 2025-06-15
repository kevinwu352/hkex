//
//  LoginViewModel.swift
//  Auth
//
//  Created by Kevin Wu on 4/29/25.
//

import SwiftUI
import Combine
import Design

@MainActor
@Observable
final class LoginViewModel {
    var bag = Set<AnyCancellable>()

    let provider: LoginProviding
    init(provider: LoginProviding) {
        self.provider = provider
        print("login vm init")
    }
    deinit { print("login vm deinit") }

    func login(id: Int) {
        Task { [weak self] in
            print("login vm login")
            let user = try? await self?.provider.login(id: id)
            if let user = user {
                await self?.provider.changeToLoggedIn(user: user)
            }
        }
        .store(in: &bag)
    }

}
