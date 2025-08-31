//
//  Modal.swift
//  Design
//
//  Created by Kevin Wu on 8/31/25.
//

import SwiftUI

public struct Modal<T: Identifiable> {
    public var paths = NavigationPath()

    public var draggable = true

    public var sheet: T?
    public var cover: T?
    public var isEmpty: Bool { sheet == nil && cover == nil }

    @discardableResult
    mutating func present(_ route: T, fullScreen: Bool, isDraggable: Bool) -> Bool {
        if isEmpty {
            paths = NavigationPath()
            draggable = isDraggable
            if fullScreen {
                cover = route
            } else {
                sheet = route
            }
            return true
        }
        return false
    }

    @discardableResult
    mutating func dismiss() -> Bool {
        if !isEmpty {
            sheet = nil
            cover = nil
            return true
        }
        return false
    }

    @discardableResult
    mutating func push<R: Hashable>(_ route: R) -> Bool {
        if !isEmpty {
            paths.append(route)
            return true
        }
        return false
    }

    @discardableResult
    mutating func pop(_ count: Int = 1) -> Bool {
        if !isEmpty {
            paths.removeLast(min(paths.count, count))
            return true
        }
        return false
    }
}
