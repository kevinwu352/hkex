//
//  AppProvider.swift
//  HKEx
//
//  Created by Kevin Wu on 5/8/25.
//

import Foundation
import Design
import Factory

@MainActor
protocol AppProviding: AnyObject, Sendable { // need sendable here, why?
    var boardedVersion: String? { get set }

    var current: User? { get }
    var channel: AsyncStream<User?> { get }
}

final class AppProvider: AppProviding {
    let defaults = Container.shared.defaults()
    let switcher = Container.shared.switcher()

    var boardedVersion: String? {
        get { defaults.boardedVersion }
        set { defaults.boardedVersion = newValue }
    }

    var current: User? {
        switcher.current
    }
    var channel: AsyncStream<User?> {
        switcher.channel
    }
}
