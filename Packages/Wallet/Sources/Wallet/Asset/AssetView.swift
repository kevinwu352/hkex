//
//  AssetView.swift
//  Wallet
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI
import Design

struct AssetView: View {
    let symbol: String
    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()
            VStack {
                Text("<head>")
                Spacer()
                Text("<foot>")
            }
        }
        .navBarTitleView(Text("asset_title_\(symbol)"))
    }
}

#Preview {
    AssetView(symbol: "BTC")
}
