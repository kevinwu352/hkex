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

    public struct Over {
        public var sheet: Routes?
        public var cover: Routes?
        public var paths = NavigationPath()
        mutating func assign(_ over: Routes, fullscreen: Bool = true) {
            guard sheet == nil && cover == nil else { return }
            if fullscreen {
                cover = over
            } else {
                sheet = over
            }
        }
        mutating func reset() {
            sheet = nil
            cover = nil
            paths = NavigationPath()
        }
    }
    public var over1 = Over()
    public func present(_ over: Routes, fullscreen: Bool = true) {
        over1.assign(over, fullscreen: fullscreen)
    }

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
