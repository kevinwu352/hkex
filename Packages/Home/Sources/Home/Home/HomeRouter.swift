//
//  HomeRouter.swift
//  Home
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI

public struct HomeRouter {

    @MainActor
    public static func createView() -> some View {
        HomeView(vm: .init())
    }

}
