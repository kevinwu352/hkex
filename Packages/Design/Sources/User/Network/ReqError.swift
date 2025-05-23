//
//  ReqError.swift
//  Design
//
//  Created by Kevin Wu on 4/22/25.
//

import Foundation

public enum ReqError: Error {
    case badURL
    case badJSON

    case serverError
    case codeError
    case dataError
    case decodeError
}
