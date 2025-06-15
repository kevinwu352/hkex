//
//  MainView.swift
//  HKEx
//
//  Created by Kevin Wu on 4/30/25.
//

import SwiftUI
import Design
import Factory
import Auth
import Home
import Market
import Wallet

struct MainView: View {
    @Injected(\.router) var router

    var body: some View {
        @Bindable var router = router
        TabView(selection: $router.current) {
            NavStack(path: $router.homes) {
                HomeRouter.createView()
                    .applyRoutes()
            }
            .tabItem {
                Image(systemName: TabBarItem.home.icon)
                Text(TabBarItem.home.title)
            }
            .tag(TabBarItem.home)

            NavStack(path: $router.markets) {
                MarketRouter.createView()
                    .applyRoutes()
            }
            .tabItem {
                Image(systemName: TabBarItem.market.icon)
                Text(TabBarItem.market.title)
            }
            .tag(TabBarItem.market)

            NavStack(path: $router.wallets) {
                WalletRouter.createView()
                    .applyRoutes()
            }
            .tabItem {
                Image(systemName: TabBarItem.wallet.icon)
                Text(TabBarItem.wallet.title)
            }
            .tag(TabBarItem.wallet)
        }
        // .onAppear {
        //     print("main appear")
        // }
        // .onDisappear {
        //     print("main disappear")
        // }
    }
}

#Preview {
    MainView()
}
