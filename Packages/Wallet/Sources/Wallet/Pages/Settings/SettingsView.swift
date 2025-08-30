//
//  SettingsView.swift
//  Wallet
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI
import Design
import Factory

struct SettingsView: View {
    @Injected(\.defaults) var defaults
    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        defaults.theme = .light
                    } label: {
                        Text("<T_light>")
                            .background(defaults.theme == .light ? Color.yellow : Color.clear)
                    }
                    Button {
                        defaults.theme = .dark
                    } label: {
                        Text("<T_dark>")
                            .background(defaults.theme == .dark ? Color.yellow : Color.clear)
                    }
                    Button {
                        defaults.theme = nil
                    } label: {
                        Text("<T_none>")
                            .background(defaults.theme == nil ? Color.yellow : Color.clear)
                    }
                }
                HStack {
                    Button {
                        defaults.language = .english
                    } label: {
                        Text("<L_en>")
                            .background(defaults.language == .english ? Color.yellow : Color.clear)
                    }
                    Button {
                        defaults.language = .french
                    } label: {
                        Text("<L_fr>")
                            .background(defaults.language == .french ? Color.yellow : Color.clear)
                    }
                    Button {
                        defaults.language = nil
                    } label: {
                        Text("<L_none>")
                            .background(defaults.language == nil ? Color.yellow : Color.clear)
                    }
                }
                HStack {
                    NavigationLink(value: Routes.settings) {
                        Image(systemName: "gear").padding()
                    }
                    NavigationLink(value: Route.asset(symbol: "BTC")) {
                        Image(systemName: "bitcoinsign").padding()
                    }
                }
                HStack {
                    Button {
                        let router = Container.shared.router()
                        router.present(.settings, fullScreen: false, draggable: false)
                    } label: { Image(systemName: "gear").padding() }
                    Button {
                        let router = Container.shared.router()
                        router.present(.settings, fullScreen: true)
                    } label: { Image(systemName: "gear").padding() }
                }
                HStack {
                    Button {
                        let router = Container.shared.router()
                        // router.push(Route.asset(symbol: "ETH"))
                        // router.pop()
                        // router.dismiss()
                        router.dismissAll()
                        router.pop(Int.max)
                    } label: { Image(systemName: "arrowshape.backward").padding() }
                }
            }
        }
        .navBarTitleView(Text("settings_title"))
    }
}

#Preview {
    SettingsView()
}
