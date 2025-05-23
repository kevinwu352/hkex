//
//  NavExt.swift
//  Design
//
//  Created by Kevin Wu on 4/2/25.
//

import SwiftUI

public extension View {
    func navDestination<D: Hashable, C: View>(for data: D.Type, @ViewBuilder destination: @escaping (D) -> C) -> some View {
        navigationDestination(for: data) { val in
            NavContentView {
                destination(val)
            }
        }
    }
}

// hide system navigation bar will disable swipe back gesture, reenable it here
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
