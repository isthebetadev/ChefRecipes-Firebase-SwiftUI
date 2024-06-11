//
//  RecipesViewModel.swift
//  chefrecipes
//
//  Created by Ruben on 11/6/24.
//

import Foundation

final class RecipesViewModel: ObservableObject {
    
    @Published var myRecipes: [MyRecipeModel] = []
    @Published var messageError: String?
    
    private let profileRepository: ProfileRepository
    
    init(profileRepository: ProfileRepository = ProfileRepository()) {
        self.profileRepository = profileRepository
    }
    
    func getMyUserRecipes(userEmail email: String) {
        profileRepository.getMyRecipes(userEmail: email) { [weak self] result in
            switch result {
            case .success(let recipeModels):
                self?.myRecipes = recipeModels
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func deleteRecipe(recipe: MyRecipeModel) {
        profileRepository.deleteRecipe(recipe: recipe)
    }
}
