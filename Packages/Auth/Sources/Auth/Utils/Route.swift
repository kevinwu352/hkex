//
//  Route.swift
//  Auth
//
//  Created by Kevin Wu on 5/2/25.
//

import SwiftUI

enum Route {
    case register
}

struct ApplyRouteViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navDestination(for: Route.self) { route in
                switch route {
                case .register:
                    RegisterRouter.createView()
                }
            }
    }
}

extension View {
    func applyRoute() -> some View {
        modifier(ApplyRouteViewModifier())
    }
}
