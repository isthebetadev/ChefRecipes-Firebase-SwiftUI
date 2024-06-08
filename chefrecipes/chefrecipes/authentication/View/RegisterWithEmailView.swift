//
//  RegisterWithEmailView.swift
//  chefrecipes
//
//  Created by Ruben on 6/6/24.
//

import SwiftUI

struct RegisterWithEmailView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            DismissView()
                .padding(.top, 10)
            
            Group {
                Text("Welcome")
                    .bold()
            }
            .padding(.top, 66)
            .font(.title)
            
            Group {
                Text("Register to access.")
                    .tint(.secondary)
                    .padding(.bottom, 32)
                TextField("Add your email", text: $email)
                    .keyboardType(.emailAddress)
                TextField("Add your username", text: $username)
                    .keyboardType(.alphabet)
                SecureField("Add your password", text: $password)
                Button(action: {
                    print("Register form submit")
                    authenticationViewModel.createNewUser(email: email, password: password, username: username)
                }, label: {
                    Text("Register")
                })
                .padding(.top, 16)
                .buttonStyle(.bordered)
                .tint(.mint)
                if let messageError = authenticationViewModel.messageError {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundStyle(.red)
                        .padding(.top, 20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterWithEmailView(authenticationViewModel: AuthenticationViewModel())
}
