//
//  TodoListItem.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
