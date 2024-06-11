//
//  RecipeRepository.swift
//  chefrecipes
//
//  Created by Ruben on 11/6/24.
//

import Foundation

final class RecipeRepository {
    
    private let recipeDataSource: RecipeDataSource
    
    init(recipeDataSource: RecipeDataSource = RecipeDataSource()) {
        self.recipeDataSource = recipeDataSource
    }
    
    func getMyRecipes(userEmail email: String,completionBlock: @escaping (Result<[MyRecipeModel], Error>) -> Void) {
        recipeDataSource.getRecipesForMyUser(userEmail: email, completionBlock: completionBlock)
    }
    
    func deleteRecipe(recipe: MyRecipeModel) {
        recipeDataSource.deleteRecipe(recipe: recipe)
    }
    
    func createNewRecipe(withRecipe recipe: MyRecipeModel, completionBlock: @escaping (Result<MyRecipeModel, Error>) -> Void) {
        recipeDataSource.createRecipe(with: recipe, completionBlock: completionBlock)
    }
    
}
