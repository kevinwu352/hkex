//
//  LoginRouter.swift
//  Auth
//
//  Created by Kevin Wu on 4/29/25.
//

import SwiftUI
import Design

public struct LoginRouter {

    @MainActor
    public static func createView() -> some View {
        LoginView(vm: .init(provider: LoginProvider()))
    }

}
