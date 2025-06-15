//
//  WalletView.swift
//  Wallet
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI
import Design
import Factory

struct WalletView: View {
    @Injected(\.switcher) var switcher
    @Injected(\.options) var options
    @State var vm: WalletViewModel
    // init(vm: WalletViewModel) {
    //     self.vm = vm
    //     print("wallet init")
    // }

    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()
            VStack {
                Text("<head>")
                Spacer()

                HStack {
                    NavigationLink(value: Routes.settings) {
                        Image(systemName: "gear").padding()
                    }
                    NavigationLink(value: Route.asset(symbol: "BTC")) {
                        Image(systemName: "bitcoinsign").padding()
                    }
                }
                Button {
                    options.accountBalanceMasked.toggle()
                } label: { Image(systemName: options.accountBalanceMasked ? "eye.slash.fill" : "eye.fill").padding() }

                Spacer()
                Text("<foot>")
            }
        }
        .onAppear {
            print("wallet appear")
        }
        .onDisappear {
            print("wallet disappear")
        }
        .task {
            print("wallet task")
        }
        .navBarBackable(false)
        .navBarTitleView(Text("wallet_title"))
        .navBarTrailView(
            Button {
                switcher.loggedOut()
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .padding(.trailing)
            }
        )
        .applyRoute()
    }
}

#Preview {
    WalletView(vm: .init())
}
