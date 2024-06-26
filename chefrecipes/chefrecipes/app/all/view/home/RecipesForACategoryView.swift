//
//  recipesForACategoryView.swift
//  chefrecipes
//
//  Created by Ruben on 20/6/24.
//

import SwiftUI

struct RecipesForACategoryView: View {
    
    @ObservedObject var viewModel: RecipeViewModel
    let category: String
    
    var body: some View {
        ZStack {
            Color.myYellow.ignoresSafeArea()
            NavigationStack {
                VStack {
                    Text("🙂 Enjoy them")
                        .font(.headline)
                    Spacer()
                    List {
                        if viewModel.recipesForCategory.isEmpty {
                            Text("Oops, it seems that we still don't have recipes for this category. Why don't you dare to create one?")
                                .font(.caption)
                                .bold()
                        } else {
                            ForEach(viewModel.recipesForCategory) { recipe in
                                VStack {
                                    NavigationLink(value: recipe) {
                                        Text(recipe.title)
                                    }
                                }
                            }
                        }
                    }
                }
                .task {
                    viewModel.getRecipesForCategory(theCategory: category)
                }
            }
            .navigationTitle("Recipes for \(category)")
        }
    }
}

#Preview {
    RecipesForACategoryView(viewModel: RecipeViewModel(), category: "lunch")
}
