//
//  RecipeOfTheDayView.swift
//  chefrecipes
//
//  Created by Ruben on 13/6/24.
//

import SwiftUI

struct RecipeOfTheDayView: View {
    

    @StateObject var recipeViewModel: RecipeViewModel = RecipeViewModel()
    @State private var isPresentingRecipeOfTheDaySheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("🌱 Here is our recipe of the day")
                    .font(.title2)
                if let recipe = recipeViewModel.recipeOfTheDay {
                    Image("recipeoftheday")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.myGreen, lineWidth: 2))
                        .onTapGesture {
                            isPresentingRecipeOfTheDaySheet = true
                        }
                    Text(recipe.title)
                        .font(.headline)
                        .padding(.top, 10)
                    Text(recipe.description)
                        .font(.subheadline)
                        .padding(.bottom, 10)
                } else {
                    Text("We were unable to load the recipe this time 😞")
                        .font(.headline)
                        .padding()
                }
                Spacer()
            }
            .padding()
            .task {
                recipeViewModel.updateRecipeOfTheDay()
            }
            .sheet(isPresented: $isPresentingRecipeOfTheDaySheet) {
                if let recipe = recipeViewModel.recipeOfTheDay {
                    MyRecipeDataView(recipe: recipe)
                }
            }
            
        }
    }
}

/*
#Preview {
    RecipeOfTheDayView()
}
*/
