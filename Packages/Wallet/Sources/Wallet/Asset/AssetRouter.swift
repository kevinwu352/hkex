//
//  AssetRouter.swift
//  Wallet
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI

struct AssetRouter {

    @MainActor
    static func createView(symbol: String) -> some View {
        AssetView(symbol: symbol)
    }

}
