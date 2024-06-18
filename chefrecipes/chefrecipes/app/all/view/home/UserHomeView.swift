//
//  UserHomeView.swift
//  chefrecipes
//
//  Created by Ruben on 13/6/24.
//

import SwiftUI

struct UserHomeView: View {
    
    @StateObject var recipeViewModel: RecipeViewModel = RecipeViewModel()
    @State var userEmail: String
    
    var body: some View {
        ZStack {
            ScrollView {
                Color.myYellow.ignoresSafeArea()
                VStack {
                    Text("Wellcome back")
                        .font(.largeTitle)
                        .bold()
                    Text("Ready to discover new flavors?")
                        .font(.subheadline)
                        .underline()
                    Spacer()
                    RecipeOfTheDayView(viewModel: recipeViewModel)
                    MostSavedRecipesView(viewModel: recipeViewModel)
                }
                .padding()
            }
            .background(Color.myYellow)
        }
    }
}

#Preview {
    UserHomeView(userEmail: "email@test.com")
}
