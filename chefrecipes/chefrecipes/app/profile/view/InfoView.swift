//
//  InfoView.swift
//  chefrecipes
//
//  Created by Ruben on 10/6/24.
//

import SwiftUI

struct InfoView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        
        VStack {
            Label("My profile", systemImage: "person")
                .font(.title2)
                .bold()
                .padding()
            
            if let email = authenticationViewModel.user?.email {
                Text("Email: \(email)")
            }
            Text("Username: ")
            Button(action: {
                print("Reset the password")
            }, label: {
                Label("Reset your password", systemImage: "key")
            })
            Button(action: {
                print("Logout the sesion")
                authenticationViewModel.logout()
            }, label: {
                Label("Log out", systemImage: "rectangle.portrait.and.arrow.right")
            })
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding([.leading, .trailing])
        
        
    }
        
}

#Preview {
    InfoView(authenticationViewModel: AuthenticationViewModel())
}
