//
//  Router.swift
//  Design
//
//  Created by Kevin Wu on 4/11/25.
//

import SwiftUI
import Factory

public extension Container {
    @MainActor
    var router: Factory<Router> {
        self { @MainActor in Router() }.scope(.session)
    }
}

@MainActor
@Observable
public final class Router {
    // init() {
    //     print("[life] router init [\(dev_obj_addr(self))]")
    // }
    // deinit { print("[life] router deinit [\(dev_obj_addr(self))]") }

    public var current: TabBarItem = .home

    public var homes = NavigationPath()
    public var markets = NavigationPath()
    public var wallets = NavigationPath()

    public func push<R: Hashable>(_ route: R, tab: TabBarItem? = nil) {
        let tab = tab ?? current
        switch tab {
        case .home:
            homes.append(route)
        case .market:
            markets.append(route)
        case .wallet:
            wallets.append(route)
        }
    }

    public func pop(_ count: Int = 1, tab: TabBarItem? = nil) {
        let tab = tab ?? current
        switch tab {
        case .home:
            homes.removeLast(min(homes.count, count))
        case .market:
            markets.removeLast(min(markets.count, count))
        case .wallet:
            wallets.removeLast(min(wallets.count, count))
        }
    }

    public func popToRoot(tab: TabBarItem? = nil) {
        let tab = tab ?? current
        switch tab {
        case .home:
            homes.removeLast(homes.count)
        case .market:
            markets.removeLast(markets.count)
        case .wallet:
            wallets.removeLast(wallets.count)
        }
    }

}
