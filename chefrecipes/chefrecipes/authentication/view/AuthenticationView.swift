//
//  ContentView.swift
//  chefrecipes
//
//  Created by Ruben on 5/6/24.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case register
    case login
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        VStack {
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(.mint, lineWidth: 2))
                .shadow(radius: 16)
                .padding(.top, 125)
            
            Text("Wellcome to Chef Recipes!")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("From now you will know what it means to eat well 😋")
                .font(.subheadline)
                .frame(width: 200)
            
            Button(action: { authenticationSheetView = .login }, label: {
                            Label("Sign in with email", systemImage: "envelope.fill")
            })
            .tint(.black)
            .controlSize(.large)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .padding(.top, 60)
            
            Spacer()
            
            HStack {
                Button(action: { authenticationSheetView = .register }, label: {
                    Text("You do not have an account?")
                    Text("Sign up")
                        .underline()
                })
                .tint(.black)
            }
         
        }
        .sheet(item: $authenticationSheetView) { sheet in
                    switch sheet {
                    case .register:
                        RegisterWithEmailView(authenticationViewModel: authenticationViewModel)
                    case .login:
                        LoginWithEmail(authenticationViewModel: authenticationViewModel)
                    }
                }
    }
}

#Preview {
    AuthenticationView(authenticationViewModel: AuthenticationViewModel())
}
