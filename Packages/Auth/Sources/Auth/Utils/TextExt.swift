//
//  TextExt.swift
//  Auth
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI

extension Text {
    init(_ key: LocalizedStringKey) {
        self.init(key, bundle: .module)
    }
}
