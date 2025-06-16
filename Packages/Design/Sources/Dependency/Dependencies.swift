//
//  Dependencies.swift
//  Design
//
//  Created by Kevin Wu on 5/9/25.
//

import Foundation
import Factory

// singleton
// graph
// unique / shared / cached

// self { Router() }.scope(.session)
public extension Scope {
    static let session = Cached()
}

// let defaults = Container.shared.defaults()   // main          observable     cached
// let secures = Container.shared.secures()     // main          observable     cached

// let switcher = Container.shared.switcher()   // main protocol                cached
// let router = Container.shared.router()       // main          observable     session
// let options = Container.shared.options()     // main          observable     session
// let network = Container.shared.network()     // send protocol                session
// let usermg = Container.shared.usermg()       // main protocol observable     session
