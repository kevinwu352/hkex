//
//  Secures.swift
//  Design
//
//  Created by Kevin Wu on 5/10/25.
//

import Foundation
import Factory
import KeychainSwift

public extension Container {
    @MainActor
    var secures: Factory<Secures> {
        self { @MainActor in .standard }.cached
    }
}
public extension Secures {
    static var standard: Secures {
        Secures(onDisk: true)
    }
    static var preview: Secures {
        Secures(onDisk: false)
    }
}

@MainActor
@Observable
public final class Secures {
    public let raw: KeychainSwift?
    public init(onDisk: Bool = true) {
        // print("[life] secures init [\(onDisk)]")
        raw = onDisk ? KeychainSwift() : nil

        lastUsername = raw?.get("last_username")
        accessToken = raw?.get("access_token")
    }
    // deinit { print("[life] secures deinit") }

    public var lastUsername: String? {
        willSet {
            if let val = newValue {
                raw?.set(val, forKey: "last_username")
            } else {
                raw?.delete("last_username")
            }
        }
    }
    public var accessToken: String? {
        willSet {
            if let val = newValue {
                raw?.set(val, forKey: "access_token")
            } else {
                raw?.delete("access_token")
            }
        }
    }
}
