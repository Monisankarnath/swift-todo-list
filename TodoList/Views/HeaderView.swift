//
//  HeaderView.swift
//  TodoList
//
//  Created by Monisankar Nath on 05/11/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String;
    let subTitle: String;
    let angle: Double
    let background: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack {
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 50))
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "Subtitle", angle: 15, background: Color.blue)
}
