//
//  LoginView.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
                HeaderView(title: "Memory Lane", subTitle: "Get Things Done", angle: 15, background: .pink)
                
                //Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    CustomButton(title: "Login", background: .blue) {
                        viewModel.login();
                    }.padding(10)
                }.offset(y: -50)
                
                
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }.padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoginView()
}
