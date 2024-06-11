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
            
            Label("My profile", systemImage: "person.fill")
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
            .buttonStyle(.bordered)
            
            Button(action: {
                print("Logout the sesion")
                authenticationViewModel.logout()
            }, label: {
                Label("Log out", systemImage: "rectangle.portrait.and.arrow.right")
            })
            .buttonStyle(.bordered)
        }
        
        
    }
        
}

#Preview {
    InfoView(authenticationViewModel: AuthenticationViewModel())
}
