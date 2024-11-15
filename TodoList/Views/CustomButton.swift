//
//  CustomButton.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    CustomButton(title: "Title", background: .pink) {
        // Action
    }
}
