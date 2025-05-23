//
//  Route.swift
//  Market
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI

enum Route: Hashable {
    case task
}

struct ApplyRouteViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navDestination(for: Route.self) { route in
                switch route {
                case .task:
                    TaskRouter.createView()
                }
            }
    }
}

extension View {
    func applyRoute() -> some View {
        modifier(ApplyRouteViewModifier())
    }
}
