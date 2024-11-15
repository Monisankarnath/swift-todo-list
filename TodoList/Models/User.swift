//
//  User.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
