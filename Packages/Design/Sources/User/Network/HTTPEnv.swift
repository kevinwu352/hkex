//
//  HTTPEnv.swift
//  Design
//
//  Created by Kevin Wu on 5/1/25.
//

import Foundation
import Factory

public extension Container {
    var network: Factory<Networkable> {
        self { HTTPClient() }.cached
    }
}
