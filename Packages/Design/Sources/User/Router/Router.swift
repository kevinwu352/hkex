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
        public var draggable = true
        @discardableResult
        mutating func present(_ route: Routes, fullScreen: Bool, draggable: Bool) -> Bool {
            if sheet == nil && cover == nil {
                paths = NavigationPath()
                self.draggable = draggable
                if fullScreen {
                    cover = route
                } else {
                    sheet = route
                }
                return true
            }
            return false
        }
        @discardableResult
        mutating func dismiss() -> Bool {
            if sheet != nil || cover != nil {
                sheet = nil
                cover = nil
                return true
            }
            return false
        }
        @discardableResult
        mutating func push<R: Hashable>(_ route: R) -> Bool {
            if sheet != nil || cover != nil {
                paths.append(route)
                return true
            }
            return false
        }
        @discardableResult
        mutating func pop(_ count: Int = 1) -> Bool {
            if sheet != nil || cover != nil {
                paths.removeLast(min(paths.count, count))
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

    public func present(_ over: Routes, fullScreen: Bool = false, draggable: Bool = true) {
        guard over1.present(over, fullScreen: fullScreen, draggable: draggable) == false else { return }
        guard over2.present(over, fullScreen: fullScreen, draggable: draggable) == false else { return }
        guard over3.present(over, fullScreen: fullScreen, draggable: draggable) == false else { return }
        guard over4.present(over, fullScreen: fullScreen, draggable: draggable) == false else { return }
        guard over5.present(over, fullScreen: fullScreen, draggable: draggable) == false else { return }
        over5.paths.append(over)
    }

    public func dismiss() {
        guard over5.dismiss() == false else { return }
        guard over4.dismiss() == false else { return }
        guard over3.dismiss() == false else { return }
        guard over2.dismiss() == false else { return }
        guard over1.dismiss() == false else { return }
    }
    public func dismissAll() {
        over5.dismiss()
        over4.dismiss()
        over3.dismiss()
        over2.dismiss()
        over1.dismiss()
    }

    public func push<R: Hashable>(_ route: R, tab: TabBarItem? = nil) {
        guard over5.push(route) == false else { return }
        guard over4.push(route) == false else { return }
        guard over3.push(route) == false else { return }
        guard over2.push(route) == false else { return }
        guard over1.push(route) == false else { return }
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
        guard over5.pop(count) == false else { return }
        guard over4.pop(count) == false else { return }
        guard over3.pop(count) == false else { return }
        guard over2.pop(count) == false else { return }
        guard over1.pop(count) == false else { return }
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

}
