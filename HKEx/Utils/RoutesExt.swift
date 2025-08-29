//
//  RoutesExt.swift
//  HKEx
//
//  Created by Kevin Wu on 4/12/25.
//

import SwiftUI
import Design
import Factory
import Home
import Market
import Wallet

struct ApplyRoutesViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navDestination(for: Routes.self) { route in
                switch route {
                case .settings:
                    SettingsRouter.createView()
                }
            }
    }
}
extension View {
    func applyRoutes() -> some View {
        modifier(ApplyRoutesViewModifier())
    }
}

extension View {
    func applySheets1() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over1.sheet) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over1.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
                .applySheets2()
                .applyCovers2()
            }
        }
    }
    func applySheets2() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over2.sheet) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over2.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
                .applySheets3()
                .applyCovers3()
            }
        }
    }
    func applySheets3() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over3.sheet) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over3.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
                .applySheets4()
                .applyCovers4()
            }
        }
    }
    func applySheets4() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over4.sheet) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over4.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
                .applySheets5()
                .applyCovers5()
            }
        }
    }
    func applySheets5() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over5.sheet) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over5.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
            }
        }
    }
}

extension View {
    func applyCovers1() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over1.cover) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over1.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
                .applySheets2()
                .applyCovers2()
            }
        }
    }
    func applyCovers2() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over2.cover) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over2.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
                .applySheets3()
                .applyCovers3()
            }
        }
    }
    func applyCovers3() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over3.cover) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over3.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
                .applySheets4()
                .applyCovers4()
            }
        }
    }
    func applyCovers4() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over4.cover) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over4.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
                .applySheets5()
                .applyCovers5()
            }
        }
    }
    func applyCovers5() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over5.cover) { route in
            switch route {
            case .settings:
                NavStack(path: $router.over5.paths) {
                    SettingsRouter.createInitial()
                        .applyRoutes()
                }
            }
        }
    }
}
