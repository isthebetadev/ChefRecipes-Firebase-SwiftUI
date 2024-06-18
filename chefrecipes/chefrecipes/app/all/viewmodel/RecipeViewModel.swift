//
//  RecipesViewModel.swift
//  chefrecipes
//
//  Created by Ruben on 11/6/24.
//

import Foundation

final class RecipeViewModel: ObservableObject {
    
    @Published var myRecipes: [MyRecipeModel] = []
    @Published var recipesInTopThreeRanking: [MyRecipeModel] = []
    @Published var recipeOfTheDay: MyRecipeModel?
    @Published var messageError: String?
    
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository = RecipeRepository()) {
        self.recipeRepository = recipeRepository
        updateRecipeOfTheDay()
        updateTopThreeSavedRecipes()
    }
    
    func updateTopThreeSavedRecipes() {
        recipeRepository.getAllRecipes { [weak self] result in
            switch result {
            case .success(let recipeModels):
                self?.recipesInTopThreeRanking = []
                if recipeModels.count > 0 {
                    let sortedRecipes = recipeModels.sorted(by: { $0.savedBy.count > $1.savedBy.count })
                    if sortedRecipes.count >= 3 {
                        self?.recipesInTopThreeRanking.append(sortedRecipes[0])
                        self?.recipesInTopThreeRanking.append(sortedRecipes[1])
                        self?.recipesInTopThreeRanking.append(sortedRecipes[2])
                    } else {
                        self?.recipesInTopThreeRanking.append(contentsOf: sortedRecipes)
                    }
                }
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func updateRecipeOfTheDay() {
        recipeRepository.getAllRecipes { [weak self] result in
            switch result {
            case .success(let recipeModels):
                if let randomElement = recipeModels.randomElement() {
                    self!.recipeOfTheDay = randomElement
                }
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
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
