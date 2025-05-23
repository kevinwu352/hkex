//
//  Uncat.swift
//  Design
//
//  Created by Kevin Wu on 4/6/25.
//

import Foundation

public func dev_obj_addr(_ obj: AnyObject) -> String {
    String(describing: Unmanaged.passUnretained(obj).toOpaque())
}

public extension Result {
    var isSuccess: Bool {
        if case .success = self { return true } else { return false }
    }
    var isFailure: Bool {
        if case .failure = self { return true } else { return false }
    }
}

public extension Bundle {
    var versionNumber: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildNumber: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }
}
