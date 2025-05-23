//
//  Api.swift
//  Auth
//
//  Created by Kevin Wu on 5/1/25.
//

import Foundation
import Design

struct Api: Endpoint {
    var path: String
    var method: ReqMethod
    var parameters: [String: Encodable]?
    var encoding: ReqEncoding = .url
    var headers: [String: String]?
}

extension Api {
    static func login() -> Self {
        .init(path: "/v3/2f5fe564-545b-4ef2-aefd-a0325245f383", method: .get)
    }
}

// https://jsonplaceholder.typicode.com/users
// [
//     {
//         "id": 1,
//         "name": "Ervin Howell",
//         "username": "ervinh",
//         "email": "ervinh110@melissa.tv",
//         "phone": "010-692-6593",
//         "website": "ervinh.net",
//         "token": "token_111-ervinh",
//         "address": {
//             "street": "Victor Plains",
//             "suite": "Suite 879",
//             "city": "Wisokyburgh",
//             "zipcode": "90566-7771",
//             "geo": {
//                 "lat": "-43.9509",
//                 "lng": "-34.4618"
//             }
//         },
//         "company": {
//             "name": "Deckow-Crist",
//             "catchPhrase": "Proactive didactic contingency",
//             "bs": "synergize scalable supply-chains"
//         }
//     },
//     {
//         "id": 2,
//         "name": "Leanne Graham",
//         "username": "leanneg",
//         "email": "leanneg110@april.biz",
//         "phone": "1-770-736-8031",
//         "website": "leanneg.org",
//         "token": "token_222-leanneg",
//         "address": {
//             "street": "Kulas Light",
//             "suite": "Apt. 556",
//             "city": "Gwenborough",
//             "zipcode": "92998-3874",
//             "geo": {
//                 "lat": "-37.3159",
//                 "lng": "81.1496"
//             }
//         },
//         "company": {
//             "name": "Romaguera-Crona",
//             "catchPhrase": "Multi-layered client-server neural-net",
//             "bs": "harness real-time e-markets"
//         }
//     }
// ]
