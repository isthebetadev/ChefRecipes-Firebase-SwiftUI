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
        NavigationStack {
            VStack {
                Text("🙂 Enjoy them")
                    .font(.headline)
                Spacer()
                List {
                    Text("Example recipe")
                    Text("Example recipe")
                    Text("Example recipe")
                    Text("Example recipe")
                }
            }
        }
        .navigationTitle("Recipes for \(category)")
    }
}

#Preview {
    RecipesForACategoryView(viewModel: RecipeViewModel(), category: "lunch")
}
