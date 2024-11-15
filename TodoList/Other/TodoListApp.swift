//
//  TodoListApp.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
