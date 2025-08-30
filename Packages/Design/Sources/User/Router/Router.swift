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
        mutating func present(_ over: Routes, fullScreen: Bool) -> Bool {
            if sheet == nil && cover == nil {
                if fullScreen {
                    cover = over
                } else {
                    sheet = over
                }
                return true
            }
            return false
        }
        mutating func dismiss() -> Bool {
            if sheet != nil || cover != nil {
                sheet = nil
                cover = nil
                paths = NavigationPath()
                return true
            }
            return false
        }
    }
    public var over1 = Over()
    public var over2 = Over()
    public var over3 = Over()
    public var over4 = Over()
    public var over5 = Over()

    public func present(_ over: Routes, fullScreen: Bool = true) {
        guard over1.present(over, fullScreen: fullScreen) == false else { return }
        guard over2.present(over, fullScreen: fullScreen) == false else { return }
        guard over3.present(over, fullScreen: fullScreen) == false else { return }
        guard over4.present(over, fullScreen: fullScreen) == false else { return }
        guard over5.present(over, fullScreen: fullScreen) == false else { return }
        over5.paths.append(over)
    }

    public func dismiss() {

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
