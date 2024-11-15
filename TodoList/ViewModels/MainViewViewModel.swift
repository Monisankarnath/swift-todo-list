//
//  MainViewViewModel.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
