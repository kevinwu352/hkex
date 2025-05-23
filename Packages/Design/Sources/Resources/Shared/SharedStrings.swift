//
//  SharedStrings.swift
//  Design
//
//  Created by Kevin Wu on 4/5/25.
//

import SwiftUI

// Text(shared: .kWelcomeMsg)
public extension Text {
    init(shared: LocalizedStringKey) {
        self.init(shared, bundle: .module)
    }
}

// Text(.kWelcomeMsg, bundle: .design)
public extension Bundle {
    static var design: Bundle { .module }
}

// All keys
public extension LocalizedStringKey {
    static var kWelcomeMsg: LocalizedStringKey { .init("_welcome_msg") }
}
