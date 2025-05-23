//
//  NavContentView.swift
//  Design
//
//  Created by Kevin Wu on 4/2/25.
//

import SwiftUI

struct NavContentView<Content: View>: View {

    @State var navBarHidden = false
    @State var backable = true
    @State var titleView: NavBarEntry?
    @State var leadView: NavBarEntry?
    @State var trailView: NavBarEntry?

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            if !navBarHidden {
                NavBar(backable: backable, title: titleView, lead: leadView, trail: trailView)
            }
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .toolbar(.hidden, for: .navigationBar)
        .onPreferenceChange(NavBarHiddenPreferenceKey.self) { value in
            self.navBarHidden = value
        }
        .onPreferenceChange(NavBarBackablePreferenceKey.self) { value in
            self.backable = value
        }
        .onPreferenceChange(NavBarTitleViewPreferenceKey.self) { value in
            self.titleView = value
        }
        .onPreferenceChange(NavBarLeadViewPreferenceKey.self) { value in
            self.leadView = value
        }
        .onPreferenceChange(NavBarTrailViewPreferenceKey.self) { value in
            self.trailView = value
        }
    }
}

#Preview {
    NavContentView {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Text("<head>")
                Spacer()
                Text("<foot>")
            }
        }
        .navBarTitleView(Text("<title>"))
    }
}
