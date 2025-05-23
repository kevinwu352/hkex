//
//  StringExt.swift
//  Design
//
//  Created by Kevin Wu on 4/2/25.
//

import Foundation

public extension String {

    var charset: CharacterSet {
        CharacterSet(charactersIn: self)
    }

    var url: URL? {
        URL(string: self)
    }
    var furl: URL {
        URL(fileURLWithPath: self)
    }

    func prefixed(_ str: String?, _ sep: String? = nil) -> String {
        if let str = str, !str.isEmpty {
            return str + (sep ?? "") + self
        } else {
            return self
        }
    }
    func suffixed(_ str: String?, _ sep: String? = nil) -> String {
        if let str = str, !str.isEmpty {
            return self + (sep ?? "") + str
        } else {
            return self
        }
    }

}
