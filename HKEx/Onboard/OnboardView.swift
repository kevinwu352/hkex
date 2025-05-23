//
//  OnboardView.swift
//  HKEx
//
//  Created by Kevin Wu on 4/2/25.
//

import SwiftUI
import Design

struct OnboardView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                Button("onboard_done") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    OnboardView()
}
