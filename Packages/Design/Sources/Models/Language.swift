//
//  Language.swift
//  Design
//
//  Created by Kevin Wu on 5/9/25.
//

import Foundation

public enum Language: String {
    case english
    case french
    public var value: Locale {
        switch self {
        case .english: Locale(identifier: "en")
        case .french: Locale(identifier: "fr")
        }
    }
}
