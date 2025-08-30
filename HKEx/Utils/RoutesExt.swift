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

extension Routes {
    @MainActor
    var view: some View {
        switch self {
        case .settings:
            SettingsRouter.createView()
        }
    }
    @MainActor
    var initial: some View {
        switch self {
        case .settings:
            SettingsRouter.createInitial()
                .applyRoutes()
        }
    }
}

extension View {
    func applyRoutes() -> some View {
        navDestination(for: Routes.self) { $0.view }
    }
}

extension View {
    func applySheets1() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over1.sheet) { route in
            NavStack(path: $router.over1.paths) { route.initial }
                .interactiveDismissDisabled(!router.over1.draggable)
                .applySheets2()
                .applyCovers2()
        }
    }
    func applySheets2() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over2.sheet) { route in
            NavStack(path: $router.over2.paths) { route.initial }
                .interactiveDismissDisabled(!router.over2.draggable)
                .applySheets3()
                .applyCovers3()
        }
    }
    func applySheets3() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over3.sheet) { route in
            NavStack(path: $router.over3.paths) { route.initial }
                .interactiveDismissDisabled(!router.over3.draggable)
                .applySheets4()
                .applyCovers4()
        }
    }
    func applySheets4() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over4.sheet) { route in
            NavStack(path: $router.over4.paths) { route.initial }
                .interactiveDismissDisabled(!router.over4.draggable)
                .applySheets5()
                .applyCovers5()
        }
    }
    func applySheets5() -> some View {
        @Bindable var router = Container.shared.router()
        return sheet(item: $router.over5.sheet) { route in
            NavStack(path: $router.over5.paths) { route.initial }
                .interactiveDismissDisabled(!router.over5.draggable)
        }
    }
}

extension View {
    func applyCovers1() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over1.cover) { route in
            NavStack(path: $router.over1.paths) { route.initial }
                .applySheets2()
                .applyCovers2()
        }
    }
    func applyCovers2() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over2.cover) { route in
            NavStack(path: $router.over2.paths) { route.initial }
                .applySheets3()
                .applyCovers3()
        }
    }
    func applyCovers3() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over3.cover) { route in
            NavStack(path: $router.over3.paths) { route.initial }
                .applySheets4()
                .applyCovers4()
        }
    }
    func applyCovers4() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over4.cover) { route in
            NavStack(path: $router.over4.paths) { route.initial }
                .applySheets5()
                .applyCovers5()
        }
    }
    func applyCovers5() -> some View {
        @Bindable var router = Container.shared.router()
        return fullScreenCover(item: $router.over5.cover) { route in
            NavStack(path: $router.over5.paths) { route.initial }
        }
    }
}
