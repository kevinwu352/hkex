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
            }
        }
    }
}
