//
//  NavBarPreferences.swift
//  Design
//
//  Created by Kevin Wu on 4/2/25.
//

import SwiftUI

struct NavBarHiddenPreferenceKey: PreferenceKey {
    static let defaultValue = false
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

struct NavBarBackablePreferenceKey: PreferenceKey {
    static let defaultValue = true
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

struct NavBarEntry: Equatable, @unchecked Sendable {
    let id = UUID()
    let view: AnyView
    static func == (lhs: NavBarEntry, rhs: NavBarEntry) -> Bool {
        lhs.id == rhs.id
    }
}
struct NavBarTitleViewPreferenceKey: PreferenceKey {
    static let defaultValue: NavBarEntry? = nil
    static func reduce(value: inout NavBarEntry?, nextValue: () -> NavBarEntry?) {
        value = nextValue()
    }
}
struct NavBarLeadViewPreferenceKey: PreferenceKey {
    static let defaultValue: NavBarEntry? = nil
    static func reduce(value: inout NavBarEntry?, nextValue: () -> NavBarEntry?) {
        value = nextValue()
    }
}
struct NavBarTrailViewPreferenceKey: PreferenceKey {
    static let defaultValue: NavBarEntry? = nil
    static func reduce(value: inout NavBarEntry?, nextValue: () -> NavBarEntry?) {
        value = nextValue()
    }
}

public extension View {

    func navBarHidden(_ hidden: Bool) -> some View {
        preference(key: NavBarHiddenPreferenceKey.self, value: hidden)
    }

    func navBarBackable(_ backable: Bool) -> some View {
        preference(key: NavBarBackablePreferenceKey.self, value: backable)
    }

    func navBarTitleView<V: View>(_ view: V) -> some View {
        preference(key: NavBarTitleViewPreferenceKey.self, value: NavBarEntry(view: .init(view)))
    }
    func navBarLeadView<V: View>(_ view: V) -> some View {
        preference(key: NavBarLeadViewPreferenceKey.self, value: NavBarEntry(view: .init(view)))
    }
    func navBarTrailView<V: View>(_ view: V) -> some View {
        preference(key: NavBarTrailViewPreferenceKey.self, value: NavBarEntry(view: .init(view)))
    }

}
