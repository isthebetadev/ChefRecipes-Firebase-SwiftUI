//
//  HomeView.swift
//  chefrecipes
//
//  Created by Ruben on 6/6/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        NavigationStack {
            VStack {
                if let user = authenticationViewModel.user {
                    Text("Wellcome back \(user.username!)")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .toolbar {
                Button(action: { authenticationViewModel.logout() }, label: {
                    Text("Logout")
                })
            }
        }
    }
}

#Preview {
    HomeView(authenticationViewModel: AuthenticationViewModel())
}
