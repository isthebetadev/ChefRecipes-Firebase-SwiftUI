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
                if let email = authenticationViewModel.user?.email {
                    Text("Wellcome back \(email)")
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
