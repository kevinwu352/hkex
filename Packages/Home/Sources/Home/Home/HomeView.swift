//
//  HomeView.swift
//  Home
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI
import Design

struct HomeView: View {
    @State var vm: HomeViewModel
    // init(vm: HomeViewModel) {
    //     self.vm = vm
    //     print("home init")
    // }

    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()
            VStack {
                Text("<head>")
                Spacer()

                HStack {
                    Button {

                    } label: { Image(systemName: "play").padding() }
                    Button {

                    } label: { Image(systemName: "stop").padding() }
                }

                Spacer()
                Text("<foot>")
            }
        }
        .onAppear {
            print("home appear")
        }
        .onDisappear {
            print("home disappear")
        }
        .task {
            print("home task")
        }
        .navBarBackable(false)
        .navBarTitleView(Text("home_title"))
    }
}

#Preview {
    HomeView(vm: .init())
}
