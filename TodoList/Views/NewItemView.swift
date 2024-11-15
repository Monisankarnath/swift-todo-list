//
//  NewItemView.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel();
    @Binding var newItemPresented: Bool
  
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 30)
            Form {
                // Name
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                CustomButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true;
                    }
                    
                }.padding(10)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                       message: Text("PLease fill in all fields and select valid date not less than today"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: {_ in
        
    }))
}
