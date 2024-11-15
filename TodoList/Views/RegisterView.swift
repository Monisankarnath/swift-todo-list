//
//  RegisterView.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subTitle: "Start organizing",
                       angle: -15,
                       background: .orange)
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                CustomButton(title: "Create Account", background: .green) {
                    viewModel.register()
                }.padding(10)
            }.offset(y: -50)
            
        }
    }
}

#Preview {
    RegisterView()
}
