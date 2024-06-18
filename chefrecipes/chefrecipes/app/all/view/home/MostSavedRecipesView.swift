//
//  MostSavedRecipesView.swift
//  chefrecipes
//
//  Created by Ruben on 13/6/24.
//

import SwiftUI

struct MostSavedRecipesView: View {
    @ObservedObject var viewModel: RecipeViewModel
    var body: some View {
        VStack {
            Text("💚 These are the most saved by all users")
                .font(.title2)
            
            ForEach(Array(viewModel.recipesInTopThreeRanking.enumerated()), id: \.offset) { index, recipe in
                RankingItem(position: index+1, title: recipe.title, savedBy: recipe.savedBy.count)
            }

            Spacer()
        }
        .padding([.leading, .bottom, .trailing])
    }
}

struct RankingItem: View {
    let position: Int
    let title: String
    let savedBy: Int
    
    var body: some View {
        HStack {
            Text("\(position).")
                .font(.headline)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text("Saved by: \(savedBy)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(10)
        .background(Color.myGreen.opacity(0.3))
        .cornerRadius(10)
    }
}

#Preview {
    MostSavedRecipesView(viewModel: RecipeViewModel())
}
