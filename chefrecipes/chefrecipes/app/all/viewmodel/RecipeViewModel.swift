//
//  RecipesViewModel.swift
//  chefrecipes
//
//  Created by Ruben on 11/6/24.
//

import Foundation

final class RecipeViewModel: ObservableObject {
    
    @Published var myRecipes: [MyRecipeModel] = []
    @Published var messageError: String?
    
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository = RecipeRepository()) {

        self.recipeRepository = recipeRepository
    }
    
    func getMyUserRecipes(userEmail email: String) {
        recipeRepository.getMyRecipes(userEmail: email) { [weak self] result in
            switch result {
            case .success(let recipeModels):
                self?.myRecipes = recipeModels
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func deleteRecipe(recipe: MyRecipeModel) {
        recipeRepository.deleteRecipe(recipe: recipe)
    }
    
    func createNewRecipe(with recipe: MyRecipeModel) {
        recipeRepository.createNewRecipe(withRecipe: recipe, completionBlock: { [weak self] result in
            switch result {
            case .success(let recipeModel):
                print("✅ Guardada receta con \(recipe.title)")
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        })
    }
}
