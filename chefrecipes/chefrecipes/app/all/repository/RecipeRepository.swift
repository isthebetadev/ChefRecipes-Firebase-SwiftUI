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
    
    func searchRecipes(searchText: String,completionBlock: @escaping (Result<[MyRecipeModel], Error>) -> Void) {
        recipeDataSource.searchRecipes(searchText:searchText, completionBlock: completionBlock)
    }
    
    func getRecipesForCategory(category: String,completionBlock: @escaping (Result<[MyRecipeModel], Error>) -> Void) {
        recipeDataSource.getRecipesForCategory(category: category, completionBlock: completionBlock)
    }
    
    func getAllRecipes(completionBlock: @escaping (Result<[MyRecipeModel], Error>) -> Void) {
        recipeDataSource.getAllRecipes(completionBlock: completionBlock)
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
