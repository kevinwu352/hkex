//
//  NavBar.swift
//  Design
//
//  Created by Kevin Wu on 4/2/25.
//

import SwiftUI

struct NavBar: View {
    @Environment(\.dismiss) var dismiss

    let backable: Bool
    let titleView: NavBarEntry?
    let leadView: NavBarEntry?
    let trailView: NavBarEntry?

    init(backable: Bool, title: NavBarEntry?, lead: NavBarEntry?, trail: NavBarEntry?) {
        self.backable = backable
        self.titleView = title
        self.leadView = lead
        self.trailView = trail
    }

    var body: some View {
        ZStack {
            if let title = titleView?.view {
                title
                    // .background(Color.yellow)
            }
            HStack {
                if let lead = leadView?.view {
                    lead
                } else if backable {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .frame(height: kNavBarH - 4)
                    .padding(.horizontal)
                    // .background(Color.yellow)
                }
                Spacer()
                if let trail = trailView?.view {
                    trail
                }
            }
        }
        .frame(height: kNavBarH)
        .foregroundStyle(Color.navbarFg)
        .background(Color.navbarBg)
        .font(.title3)
    }
}

#Preview {
    VStack(spacing: 0) {
        NavBar(backable: true,
               title: .init(view: .init(Text("<title>"))),
               lead: nil,
               trail: nil
        )
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Text("<head>")
                Spacer()
                Text("<foot>")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
