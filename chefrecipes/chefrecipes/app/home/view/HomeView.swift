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
                    
                    Text("Home view")
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    
                    Text("Search recipes view")
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    
                    ProfileView(authenticationViewModel: authenticationViewModel)
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    
                }
            }
        }
    }
}

#Preview {
    HomeView(authenticationViewModel: AuthenticationViewModel())
}
