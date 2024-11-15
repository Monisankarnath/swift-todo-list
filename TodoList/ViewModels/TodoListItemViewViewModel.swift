//
//  TodoListItemViewViewModel.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListItemViewViewModel: ObservableObject {
    init(){}
    
    func toggleCheck(item: TodoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
