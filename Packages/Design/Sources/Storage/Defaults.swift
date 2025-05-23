//
//  Defaults.swift
//  Design
//
//  Created by Kevin Wu on 4/28/25.
//

import Foundation
import Factory

public extension Container {
    @MainActor
    var defaults: Factory<Defaults> {
        self { @MainActor in .standard }.cached
    }
}
public extension Defaults {
    static var standard: Defaults {
        Defaults(onDisk: true)
    }
    static var preview: Defaults {
        Defaults(onDisk: false)
    }
}

@MainActor
@Observable
public final class Defaults {
    public let raw: Storage
    public init(onDisk: Bool = true) {
        // print("[life] defaults init [\(onDisk)]")
        raw = Storage(path: onDisk ? pathmk("Preferences/defaults-app-shared.json", nil) : "")

        boardedVersion = raw.getString("boarded_version")

        if let code = raw.getString("theme_code") {
            theme = Theme(rawValue: code)
        }
        if let code = raw.getString("language_code") {
            language = Language(rawValue: code)
        }
    }
    // deinit { print("[life] defaults deinit") }

    public var boardedVersion: String? {
        willSet { raw.setString(newValue, "boarded_version") }
    }

    public var theme: Theme? {
        willSet { raw.setString(newValue?.rawValue, "theme_code") }
    }
    public var language: Language? {
        willSet { raw.setString(newValue?.rawValue, "language_code") }
    }
}
