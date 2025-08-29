//
//  LoginView.swift
//  Auth
//
//  Created by Kevin Wu on 4/29/25.
//

import SwiftUI
import Design

struct LoginView: View {

    @State var vm: LoginViewModel

    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()

            VStack {
                Text("<head>")
                Spacer()

                HStack {
                    Button {
                        vm.login(id: 1)
                    } label: { Image(systemName: "01.square.fill").padding() }
                    Button {
                        vm.login(id: 2)
                    } label: { Image(systemName: "02.square.fill").padding() }
                }
                .font(.largeTitle)

                Spacer()
                Text("<foot>")
            }
        }
        .navBarBackable(false)
        .navBarTitleView(Text("login_title"))
        .navBarTrailView(
            NavigationLink(value: Route.register) {
                Image(systemName: "person.fill.badge.plus")
                    .padding(.trailing)
            }
        )
    }
}

#Preview {
    LoginView(vm: .init(provider: LoginProvider()))
}
