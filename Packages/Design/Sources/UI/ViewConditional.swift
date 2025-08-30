//
//  ViewConditional.swift
//  Design
//
//  Created by Kevin Wu on 8/30/25.
//

import SwiftUI

// https://www.objc.io/blog/2021/08/24/conditional-view-modifiers/

public extension View {

    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder
    func ifLet<T, Content: View>(_ value: T?, transform: (Self, T) -> Content) -> some View {
        if let value {
            transform(self, value)
        } else {
            self
        }
    }

}
