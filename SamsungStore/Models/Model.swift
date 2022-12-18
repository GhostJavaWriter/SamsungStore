//
//  Model.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 12.12.2022.
//

import Foundation

struct User {
    let login: String
    var password: String
}

extension User {
    static var users = [
        User(login: "login", password: "password")
    ]
}
