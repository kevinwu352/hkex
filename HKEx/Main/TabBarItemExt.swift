//
//  TabBarItemExt.swift
//  HKEx
//
//  Created by Kevin Wu on 5/4/25.
//

import SwiftUI
import Design

extension TabBarItem {
    var icon: String {
        switch self {
        case .home: "house"
        case .market: "chart.bar"
        case .wallet: "wallet.bifold"
        }
    }

    var title: LocalizedStringKey {
        switch self {
        case .home: LocalizedStringKey("tab_home")
        case .market: LocalizedStringKey("tab_market")
        case .wallet: LocalizedStringKey("tab_wallet")
        }
    }

    var color: Color {
        switch self {
        case .home: Color.red
        case .market: Color.green
        case .wallet: Color.blue
        }
    }
}
