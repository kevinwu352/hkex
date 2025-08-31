//
//  Routes.swift
//  Design
//
//  Created by Kevin Wu on 4/12/25.
//

import SwiftUI

public enum Routes: Identifiable {
    public var id: Int { hashValue }

    case settings
}

@MainActor
public var routesViewHandler: (Routes) -> AnyView = { _ in AnyView(EmptyView()) }

public extension View {
    func applyRoutes() -> some View {
        navDestination(for: Routes.self) { routesViewHandler($0) }
    }
}
