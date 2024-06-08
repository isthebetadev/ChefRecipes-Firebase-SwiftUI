//
//  AuthenticationViewModel.swift
//  chefrecipes
//
//  Created by Ruben on 6/6/24.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var messageError: String?
    
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository()) {
        self.authenticationRepository = authenticationRepository
        getCurrentUser()
    }
    
    func createNewUser(email: String, password: String, username: String) {
        authenticationRepository.createNewUser(email: email,
                                               password: password) { [weak self] result in
            switch result {
                case .success(let user):
                    self?.user = user
                // TODO create user in DB with the username
                case .failure(let error):
                    self?.messageError = error.localizedDescription
            }
        }
    }
    
    func getCurrentUser() {
        self.user = authenticationRepository.getCurrentUser()
    }

    func logout() {
        do {
            try authenticationRepository.logout()
            self.user = nil
        } catch {
            print("Error handling logout")
        }
    }
    
    func login(email: String, password: String) {
        authenticationRepository.login(email: email,
                                               password: password) { [weak self] result in
            switch result {
                case .success(let user):
                    self?.user = user
                case .failure(let error):
                    self?.messageError = error.localizedDescription
            }
        }
    }
}
