//
//  SettingsRouter.swift
//  Wallet
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI

public struct SettingsRouter {

    @MainActor
    public static func createView() -> some View {
        SettingsView()
    }

    @MainActor
    public static func createInitial() -> some View {
        SettingsView()
            .applyRoute()
    }

}
