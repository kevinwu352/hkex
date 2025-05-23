//
//  Dependencies.swift
//  Design
//
//  Created by Kevin Wu on 5/9/25.
//

import Foundation
import Factory

// self { Router() }.scope(.session)
public extension Scope {
    static let session = Cached()
}

// let defaults = Container.shared.defaults()   // main-observable
// let secures = Container.shared.secures()     // main-observable

// let switcher = Container.shared.switcher()   // main-protocol
// let network = Container.shared.network()     // send-protocol
// let router = Container.shared.router()       // main-observable
// let options = Container.shared.options()     // main-observable
// let manager = Container.shared.manager()     // main-protocol-observable
