//
//  ProfileView.swift
//  chefrecipes
//
//  Created by Ruben on 10/6/24.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var profileViewModel: ProfileViewModel = ProfileViewModel()
    @StateObject var recipeViewModel: RecipeViewModel = RecipeViewModel()
    
    var body: some View {
        VStack {
            InfoView(authenticationViewModel: authenticationViewModel)
            MyRecipesView(authenticationViewModel: authenticationViewModel, recipeViewModel: recipeViewModel)
        }
    }
}

#Preview {
    ProfileView(authenticationViewModel: AuthenticationViewModel())
}
