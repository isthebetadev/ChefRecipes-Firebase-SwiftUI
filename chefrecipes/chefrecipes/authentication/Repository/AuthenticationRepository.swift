//
//  AuthenticationRepository.swift
//  chefrecipes
//
//  Created by Ruben on 6/6/24.
//

import Foundation

final class AuthenticationRepository {
    private let authenticationFirebaseDataSource: AuthenticationFirebaseDataSource
        
    init(authenticationFirebaseDataSource: AuthenticationFirebaseDataSource = AuthenticationFirebaseDataSource()) {
        self.authenticationFirebaseDataSource = authenticationFirebaseDataSource
    }

    
    func createNewUserInCollection(with user: User) {
        authenticationFirebaseDataSource.createNewUserInFirebaseCollection(with: user)
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDataSource.createNewUser(email: email,
                                                       password: password,
                                                       completionBlock: completionBlock)
    }
    
    func getCurrentUser() -> User? {
        authenticationFirebaseDataSource.getCurrentUser()
    }
    
    func logout() throws {
        try authenticationFirebaseDataSource.logout()
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDataSource.login(email: email,
                                                       password: password,
                                                       completionBlock: completionBlock)
    }
    
}
