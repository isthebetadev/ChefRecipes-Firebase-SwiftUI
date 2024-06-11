//
//  ProfileRepository.swift
//  chefrecipes
//
//  Created by Ruben on 11/6/24.
//

import Foundation

final class ProfileRepository {
    
    private let profileDataSource: ProfileDataSource
    
    init(profileDataSource: ProfileDataSource = ProfileDataSource()) {
        self.profileDataSource = profileDataSource
    }
    
    func getAllLinks(userEmail email: String,completionBlock: @escaping (Result<[MyRecipeModel], Error>) -> Void) {
        profileDataSource.getRecipesForMyUser(userEmail: email, completionBlock: completionBlock)
    }
    
}
