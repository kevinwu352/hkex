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

    public var modal1 = Modal<Routes>()
    public var modal2 = Modal<Routes>()
    public var modal3 = Modal<Routes>()
    public var modal4 = Modal<Routes>()
    public var modal5 = Modal<Routes>()

    public func present(_ route: Routes, fullScreen: Bool = false, isDraggable: Bool = true) {
        guard modal1.present(route, fullScreen: fullScreen, isDraggable: isDraggable) == false else { return }
        guard modal2.present(route, fullScreen: fullScreen, isDraggable: isDraggable) == false else { return }
        guard modal3.present(route, fullScreen: fullScreen, isDraggable: isDraggable) == false else { return }
        guard modal4.present(route, fullScreen: fullScreen, isDraggable: isDraggable) == false else { return }
        guard modal5.present(route, fullScreen: fullScreen, isDraggable: isDraggable) == false else { return }
        modal5.paths.append(route)
    }

    public func dismiss() {
        guard modal5.dismiss() == false else { return }
        guard modal4.dismiss() == false else { return }
        guard modal3.dismiss() == false else { return }
        guard modal2.dismiss() == false else { return }
        guard modal1.dismiss() == false else { return }
    }
    public func dismissAll() {
        modal5.dismiss()
        modal4.dismiss()
        modal3.dismiss()
        modal2.dismiss()
        modal1.dismiss()
    }

    public func push<R: Hashable>(_ route: R, tab: TabBarItem? = nil) {
        guard modal5.push(route) == false else { return }
        guard modal4.push(route) == false else { return }
        guard modal3.push(route) == false else { return }
        guard modal2.push(route) == false else { return }
        guard modal1.push(route) == false else { return }
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
        guard modal5.pop(count) == false else { return }
        guard modal4.pop(count) == false else { return }
        guard modal3.pop(count) == false else { return }
        guard modal2.pop(count) == false else { return }
        guard modal1.pop(count) == false else { return }
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
