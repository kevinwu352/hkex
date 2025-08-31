//
//  App.swift
//  HKEx
//
//  Created by Kevin Wu on 3/28/25.
//

import SwiftUI
import Design
import Factory

@main
struct MainApp: App {
    init() {
#if DEBUG
        print(NSHomeDirectory())
#endif
        routesViewHandler = { AnyView($0.view) }
    }

    let defaults = Container.shared.defaults()

    var body: some Scene {
        WindowGroup {
            AppView()
                .preferredColorScheme(defaults.theme?.value)
                .environment(\.locale, defaults.language?.value ?? .current)
        }
    }

}
