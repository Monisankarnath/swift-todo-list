//
//  TodoListItemsView.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewModel;
    @FirestoreQuery var items: [TodoListItem];
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("My Memory")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        
    }
}

#Preview {
    TodoListView(userId: "sqaeu9WvzdcVFOxFcFJ7mvbPzUB3")
}
