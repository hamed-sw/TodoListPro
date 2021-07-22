//
//  Model.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import Foundation

struct APIResponce: Codable {
    let documents: [TodoFile]
}
struct TodoFile: Codable {
    let name: String
    let fields: Details
}
struct Details: Codable {
    let name: Value
}

struct Value: Codable {
    let stringValue: String
}
