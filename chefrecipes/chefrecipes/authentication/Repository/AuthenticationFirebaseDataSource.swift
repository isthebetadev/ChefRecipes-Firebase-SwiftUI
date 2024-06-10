//
//  AuthenticationFirebaseDataSource.swift
//  chefrecipes
//
//  Created by Ruben on 6/6/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

struct User: Decodable, Encodable {
    let email: String
    var username: String?
}

final class AuthenticationFirebaseDataSource {
    
    private let database = Firestore.firestore()
    private let collection = "users"
    
    
    func getCurrentUserUsername(email: String, completion: @escaping (String?) -> Void) {
        database.collection(collection).whereField("email", isEqualTo: email).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion(nil)
            } else {
                if let document = querySnapshot?.documents.first {
                    let username = document.data()["username"] as? String
                    completion(username)
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    func createNewUserInFirebaseCollection(with user: User) {
        do {
            _ = try database.collection(collection).addDocument(from: user)

        } catch {
            print("❌ error creating user in collection -> \(error.localizedDescription)")
        }
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error creating user \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "no email"
            print("New user create with email \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email: email)
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error login user \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "no email"
            print("User login with email \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
}
