//
//  RegisterView.swift
//  Auth
//
//  Created by Kevin Wu on 4/29/25.
//

import SwiftUI
import Design

struct RegisterView: View {
    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()
        }
        .navBarTitleView(Text("register_title"))
    }
}

#Preview {
    RegisterView()
}
