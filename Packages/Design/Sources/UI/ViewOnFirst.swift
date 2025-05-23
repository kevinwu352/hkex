//
//  ViewOnFirst.swift
//  Design
//
//  Created by Kevin Wu on 5/4/25.
//

import SwiftUI

struct OnFirstAppearViewModifier: ViewModifier {

    @State private var appeared = false
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                guard !appeared else { return }
                appeared = true
                action()
            }
    }
}

struct OnFirstTaskViewModifier: ViewModifier {

    @State private var appeared = false
    let action: () async -> Void

    func body(content: Content) -> some View {
        content
            .task {
                guard !appeared else { return }
                appeared = true
                await action()
            }
    }
}

public extension View {

    func onFirstAppear(action: @escaping () -> Void) -> some View {
        modifier(OnFirstAppearViewModifier(action: action))
    }

    func onFirstTask(action: @escaping () async -> Void) -> some View {
        modifier(OnFirstTaskViewModifier(action: action))
    }

}
