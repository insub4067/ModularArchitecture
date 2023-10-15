//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/13/23.
//

import SwiftUI
import DesignSystem

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Group {
                if let user = viewModel.user {
                    Text("login: " + user.login)
                    Text("id: " + "\(user.id)")
                } else {
                    Text("Search User")
                }
            }.modifier(TitleModifier())
            
            Spacer()
            
            TextField("Username", text: $viewModel.usernameInput)
                .modifier(TextFieldModifier())
            
            Button {
                viewModel.didTapButton()
            } label: {
                Text("Tap to Get User")
                    .modifier(ButtonModifier())
            }
        }
        .padding()
        .frame(height: 150)
    }
}

#Preview {
    ContentView()
}
