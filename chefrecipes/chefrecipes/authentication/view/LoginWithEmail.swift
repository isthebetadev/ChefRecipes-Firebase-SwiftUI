//
//  LoginWithEmail.swift
//  chefrecipes
//
//  Created by Ruben on 6/6/24.
//

import SwiftUI

struct LoginWithEmail: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    var body: some View {
        VStack {
            
            DismissView()
                .padding(.top, 10)
            
            Group {
                Text("Welcome back")
                    .bold()
            }
            .padding(.top, 66)
            .font(.title)
            .tint(.primary)
            
            Group {
                Text("Log in to access your recipes.")
                    .tint(.secondary)
                    .padding(.bottom, 32)
                TextField("Add your email", text: $textFieldEmail)
                    .keyboardType(.emailAddress)
                SecureField("Add your password", text: $textFieldPassword)
                Button(action: {
                    print("Login form submit")
                    authenticationViewModel.login(email: textFieldEmail, password: textFieldPassword)
                }, label: {
                    Text("Login")
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
    LoginWithEmail(authenticationViewModel: AuthenticationViewModel())
}
