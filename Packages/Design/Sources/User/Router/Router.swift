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
        mutating func assign(_ over: Routes, fullscreen: Bool) -> Bool {
            guard sheet == nil && cover == nil else { return false }
            if fullscreen {
                cover = over
            } else {
                sheet = over
            }
            return true
        }
        mutating func reset() {
            sheet = nil
            cover = nil
            paths = NavigationPath()
        }
    }
    public var over1 = Over()
    public var over2 = Over()
    public var over3 = Over()
    public var over4 = Over()
    public var over5 = Over()
    public func present(_ over: Routes, fullscreen: Bool = true) {
        guard over1.assign(over, fullscreen: fullscreen) == false else { return }
        guard over2.assign(over, fullscreen: fullscreen) == false else { return }
        guard over3.assign(over, fullscreen: fullscreen) == false else { return }
        guard over4.assign(over, fullscreen: fullscreen) == false else { return }
        guard over5.assign(over, fullscreen: fullscreen) == false else { return }
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
