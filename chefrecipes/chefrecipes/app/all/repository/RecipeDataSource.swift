//
//  RecipeDataSource.swift
//  chefrecipes
//
//  Created by Ruben on 11/6/24.
//



import Foundation
import FirebaseFirestore

struct MyRecipeModel: Decodable, Encodable, Identifiable, Hashable {
    @DocumentID var id: String?
    let title: String
    let description: String
    let fromUser: String
    let ingredients: [String]
    let steps: [String]
    let savedBy: [String]
    let isPublic: Bool
    let creationDate: TimeInterval
}

final class RecipeDataSource {
    private let database = Firestore.firestore()
    private let recipesCollection = "recipes"
    
    func getRecipesForMyUser(userEmail email: String,completionBlock: @escaping (Result<[MyRecipeModel], Error>) -> Void) {
        database.collection(recipesCollection).whereField("fromUser", isEqualTo: email)
            .addSnapshotListener { query, error in
                if let error = error {
                    print("Error getting all links \(error.localizedDescription)")
                    completionBlock(.failure(error))
                    return
                }
                guard let documents = query?.documents.compactMap({ $0 }) else {
                    completionBlock(.success([]))
                    return
                }
                let links = documents.map { try? $0.data(as: MyRecipeModel.self) }
                                     .compactMap { $0 }
                completionBlock(.success(links))
            }
    }
    
    func deleteRecipe(recipe: MyRecipeModel) {
        guard let documentId = recipe.id else {
            return
        }
        database.collection(recipesCollection).document(documentId).delete()
    }
    
    func createRecipe(with recipe: MyRecipeModel, completionBlock: @escaping (Result<MyRecipeModel, Error>) -> Void) {
        do {
            _ = try database.collection(recipesCollection).addDocument(from: recipe)
            completionBlock(.success(recipe))
        } catch {
            print("❌ Error creating recipe ")
            completionBlock(.failure(error))
        }
    }
}
