//
//  SearchView.swift
//  chefrecipes
//
//  Created by Ruben on 1/7/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var recipeViewModel: RecipeViewModel = RecipeViewModel()
    @State private var searchText: String = ""
    @State private var searchedRecipesInView: [MyRecipeModel] = []
    
    var body: some View {
        ZStack {
            Color.myYellow.ignoresSafeArea()
            VStack {
                Text("✨ It's time to look for that special recipe")
                    .font(.title2)
                    .padding()
                
                HStack {
                    TextField("Search...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 25)
                    
                    Button(action: {
                        search()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color.mint)
                            .cornerRadius(5)
                            .frame(height: 25)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                }
                .padding()
                
                List {
                    if searchedRecipesInView.isEmpty {
                        Text("It seems we don't have that recipe yet. Why don't you try creating it yourself?")
                            .font(.caption)
                            .bold()
                    } else {
                        ForEach(searchedRecipesInView) { recipe in
                            Text(recipe.title)
                        }
                    }
                    
                }
                
                
                
            }
        }
    }
    
    func search(){
        print("Searching with text \(searchText)")
        searchedRecipesInView = []
        recipeViewModel.searchRecipesByTitle(with: searchText)
        searchedRecipesInView = recipeViewModel.searchedRecipes
    }
    
}

#Preview {
    SearchView()
}
