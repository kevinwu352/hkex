//
//  RoutesExt.swift
//  HKEx
//
//  Created by Kevin Wu on 4/12/25.
//

import SwiftUI
import Design
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
