//
//  MostSavedRecipesView.swift
//  chefrecipes
//
//  Created by Ruben on 13/6/24.
//

import SwiftUI

struct MostSavedRecipesView: View {
    var body: some View {
        
        @StateObject var recipeViewModel: RecipeViewModel = RecipeViewModel()
        
        VStack {
            Text("💚 These are the most saved by all users")
                .font(.title2)
            Spacer()
        }
        .padding([.leading, .bottom, .trailing])
    }
}

#Preview {
    MostSavedRecipesView()
}