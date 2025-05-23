//
//  WalletRouter.swift
//  Wallet
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI

public struct WalletRouter {

    @MainActor
    public static func createView() -> some View {
        WalletView(vm: .init())
    }

}
