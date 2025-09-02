//
//  Metric.swift
//  Design
//
//  Created by Kevin Wu on 9/2/25.
//

import UIKit

@MainActor
public var kKeyWindow: UIWindow? {
    UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first { $0.isKeyWindow }
}

@MainActor
public let kScreenW = Double(UIScreen.main.bounds.width)
@MainActor
public let kScreenH = Double(UIScreen.main.bounds.height)

@MainActor
public let kSafeTop = Double(kKeyWindow?.safeAreaInsets.top ?? 0.0)
@MainActor
public let kSafeBot = Double(kKeyWindow?.safeAreaInsets.bottom ?? 0.0)

@MainActor
public let kStatusBarH = kSafeBot > 0 ? kSafeTop : 20.0
public let kNavBarH = 44.0
public let kTabBarH = 49.0

@MainActor
public let kTopH = kStatusBarH + kNavBarH
@MainActor
public let kBotH = kSafeBot + kTabBarH
