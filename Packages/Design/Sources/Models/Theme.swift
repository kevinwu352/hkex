//
//  Theme.swift
//  Design
//
//  Created by Kevin Wu on 5/9/25.
//

import SwiftUI

public enum Theme: String {
    case light
    case dark
    public var value: ColorScheme {
        switch self {
        case .light: .light
        case .dark: .dark
        }
    }
}
