//
//  Route.swift
//  Wallet
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI
import Design

enum Route: Hashable {
    case asset(symbol: String)
}

extension Route {
    @MainActor
    var view: some View {
        switch self {
        case let .asset(symbol):
            AssetRouter.createView(symbol: symbol)
        }
    }
}

extension View {
    func applyRoute() -> some View {
        navDestination(for: Route.self) { $0.view }
    }
}
