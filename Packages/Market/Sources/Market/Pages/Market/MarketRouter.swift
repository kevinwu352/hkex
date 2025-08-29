//
//  MarketRouter.swift
//  Market
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI
import Design

public struct MarketRouter {

    @MainActor
    public static func createInitial() -> some View {
        MarketView(vm: .init(provider: MarketProvider()))
            .applyRoute()
    }

}
