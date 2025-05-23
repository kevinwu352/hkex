//
//  AppViewModel.swift
//  HKEx
//
//  Created by Kevin Wu on 4/29/25.
//

import SwiftUI
import Design
import Factory
import Auth

extension Container {
    @MainActor
    var appVm: Factory<AppViewModel> {
        self { @MainActor in AppViewModel(provider: AppProvider()) }.cached
    }
}

@MainActor
@Observable
final class AppViewModel {
    let provider: AppProviding
    init(provider: AppProviding) {
        self.provider = provider

        loadShowOnboard()

        setLastUser(provider.current)
        setLoggedIn(lastUser != nil)

        observeUserChange()
    }

    var showOnboard = false
    func loadShowOnboard() {
        guard let current = Bundle.main.versionNumber else { return }
        if let boarded = provider.boardedVersion {
            showOnboard = current.compare(boarded, options: .numeric) == .orderedDescending
        } else {
            showOnboard = true
        }
    }
    func didOnboard() {
        provider.boardedVersion = Bundle.main.versionNumber
    }

    var lastUser: User? {
        willSet { resetEnvs(old: lastUser, new: newValue) }
    }
    // make sure `willSet` get called
    func setLastUser(_ value: User?) {
        lastUser = value
    }

    var loggedIn = false
    func setLoggedIn(_ value: Bool) {
        loggedIn = value
    }

    func observeUserChange() {
        Task {
            for await user in provider.channel.dropFirst() {
                setLastUser(user)
                setLoggedIn(user != nil)
            }
        }
        // Task.detached { [weak self] in
        //     guard let self = self else { return }
        //     let channel = await self.provider.channel
        //     for await user in channel.dropFirst() {
        //         await self.setLastUser(user)
        //         await self.setLoggedIn(user != nil)
        //     }
        // }
    }

    func resetEnvs(old: User?, new: User?) {
        let oldLogged = old != nil
        let newLogged = new != nil
        if oldLogged != newLogged {
            if let new = new {
                Container.shared.network.register { HTTPClient(token: new.token) }
                // Container.shared.router.register { Router() }
                Container.shared.options.register { @MainActor in UserOptions(onDisk: true, user: new.username) }
                Container.shared.manager.register { @MainActor in UserManager(user: new) }
            } else {
                Container.shared.network.register { HTTPClient(token: nil) }
                // Container.shared.router.register { Router() }
                Container.shared.options.register { @MainActor in UserOptions(onDisk: true, user: "") }
                Container.shared.manager.register { @MainActor in UserManagerPh(user: .init()) }
            }
            Container.shared.manager.reset(scope: .session)
        }
    }

}
