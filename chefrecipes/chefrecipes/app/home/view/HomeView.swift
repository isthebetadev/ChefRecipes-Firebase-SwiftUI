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
        Text("Its Home 🏠")
    }
}

#Preview {
    HomeView(authenticationViewModel: AuthenticationViewModel())
}
