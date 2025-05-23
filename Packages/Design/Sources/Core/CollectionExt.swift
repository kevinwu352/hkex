//
//  CollectionExt.swift
//  Design
//
//  Created by Kevin Wu on 4/6/25.
//

import Foundation

public extension Collection {

    var notEmpty: Bool { !isEmpty }

    func at(_ i: Index) -> Element? {
        indices.contains(i) ? self[i] : nil
    }

}
