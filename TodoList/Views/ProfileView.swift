//
//  ProfileView.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel();
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        // Info : name, Email, Member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ").bold()
                Text(user.name)
            }.padding(.bottom, 10)
            HStack {
                Text("Email: ").bold()
                Text(user.email)
            }.padding(.bottom, 10)
            HStack {
                Text("Member Since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding(.bottom, 10)
        }
        // sign out
        Button("Log Out") {
            viewModel.logout();
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
