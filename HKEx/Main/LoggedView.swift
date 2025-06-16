//
//  LoggedView.swift
//  HKEx
//
//  Created by Kevin Wu on 5/2/25.
//

import SwiftUI
import Design
import Factory

struct LoggedView: View {
    @Injected(\.switcher) var switcher

    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()
            VStack {
                Button {
                    switcher.loggedOut()
                } label: { Image(systemName: "rectangle.portrait.and.arrow.right").padding() }
                Button {
                    print( Container.shared.router() )
                    print( Container.shared.options() )
                    print( Container.shared.network() )
                } label: { Image(systemName: "printer").padding() }
            }
        }
    }
}

#Preview {
    LoggedView()
}
