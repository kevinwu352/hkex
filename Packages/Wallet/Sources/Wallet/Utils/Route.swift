//
//  Route.swift
//  Wallet
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI

enum Route: Hashable {
    case asset(symbol: String)
}

struct ApplyRouteViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navDestination(for: Route.self) { route in
                switch route {
                case let .asset(symbol):
                    AssetRouter.createView(symbol: symbol)
                }
            }
    }
}

extension View {
    func applyRoute() -> some View {
        modifier(ApplyRouteViewModifier())
    }
}
