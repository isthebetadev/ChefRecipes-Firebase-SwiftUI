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
                TabView {
                    
                    UserHomeView(userEmail: authenticationViewModel.user?.email ?? "")
                        .tabItem {
                            Image(systemName: "house")
                                .foregroundStyle(.black)
                            Text("Home")
                        }
                    
                    Text("Search recipes view")
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.black)
                            Text("Search")
                        }
                    
                    ProfileView(authenticationViewModel: authenticationViewModel)
                        .tabItem {
                            Image(systemName: "person")
                                .foregroundStyle(.black)
                            Text("Profile")
                        }
                    
                }
                .tint(.black)
            }
        }
    }
}

#Preview {
    HomeView(authenticationViewModel: AuthenticationViewModel())
}
