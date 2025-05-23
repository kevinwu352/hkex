//
//  User.swift
//  Design
//
//  Created by Kevin Wu on 4/15/25.
//

import Foundation

public struct User: Codable, Equatable, Sendable {
    public let id: Int
    public let name: String
    public let username: String
    public let email: String
    public let phone: String
    public let website: String
    public var token: String

    public init() {
        id = 0
        name = ""
        username = ""
        email = ""
        phone = ""
        website = ""
        token = ""
    }

    public init(id: Int, name: String, username: String, email: String, phone: String, website: String, token: String) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.phone = phone
        self.website = website
        self.token = token
    }
}

public extension User {
    func setPhone(_ phone: String) -> Self {
        .init(id: id,
              name: name,
              username: username,
              email: email,
              phone: phone,
              website: website,
              token: token
        )
    }
}

public extension User {
    static func load(username: String, token: String) -> User? {
        if let data = data_read(pathmk("user.json", username)),
           var obj = try? JSONDecoder().decode(Self.self, from: data) {
            obj.token = token
            return obj
        }
        return nil
    }
    func save() {
        guard !username.isEmpty else { return }
        var obj = self
        obj.token = ""
        if let data = try? JSONEncoder().encode(obj) {
            data_write(data, pathmk("user.json", username))
        }
    }
}

public typealias Users = [User]

public extension User {
    static let kevin = User(id: 1,
                            name: "Kevin",
                            username: "kevin110",
                            email: "kevin@gmail.com",
                            phone: "13500001111",
                            website: "kevin.com",
                            token: "token111"
    )
    static let eric = User(id: 1,
                           name: "Eric",
                           username: "eric110",
                           email: "eric@gmail.com",
                           phone: "13500002222",
                           website: "eric.com",
                           token: "token222"
    )
}
