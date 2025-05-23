//
//  AppView.swift
//  HKEx
//
//  Created by Kevin Wu on 4/29/25.
//

import SwiftUI
import Design
import Factory
import Auth

struct AppView: View {

    @State private var vm = Container.shared.appVm()

    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()
            if !vm.showOnboard {
                if vm.loggedIn {
                    MainView()
                        .transition(.move(edge: .trailing))
                } else {
                    NavStack {
                        LoginRouter.createView()
                    }
                    .transition(.move(edge: .leading))
                }
            }
        }
        .animation(.smooth, value: vm.loggedIn)
        .sheet(isPresented: $vm.showOnboard) {
            vm.didOnboard()
        } content: {
            OnboardView()
                .interactiveDismissDisabled()
        }
    }
}

#Preview {
    AppView()
}
