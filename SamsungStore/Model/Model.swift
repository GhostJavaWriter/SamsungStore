//
//  Model.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 12.12.2022.
//

import Foundation

struct City {
    let name: String
}

struct User {
    let name: String
    var city: City?
}
