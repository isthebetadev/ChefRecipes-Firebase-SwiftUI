//
//  NewRecipeSheet.swift
//  chefrecipes
//
//  Created by Ruben on 11/6/24.
//

import SwiftUI

struct NewRecipeSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredients: [String] = []
    @State private var steps: [String] = []
    @State private var isPublic: Bool = true
    @State var fromUser: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.myGreen.ignoresSafeArea()
                Form {
                    Section(header: Text("Recipe details")) {
                        TextField("Title", text: $title)
                        TextField("Description", text: $description)
                        Toggle(isOn: $isPublic) {
                            Text("Status")
                        }
                    }
                    
                    Section(header: Text("Ingredients")) {
                        ForEach(0..<ingredients.count, id: \.self) { index in
                            TextField("Ingredient \(index + 1)", text: Binding(
                                get: { self.ingredients[index] },
                                set: { self.ingredients[index] = $0 }
                            ))
                        }
                        Button(action: {
                            ingredients.append("")
                        }) {
                            Label("Add ingredients", systemImage: "plus")
                        }
                    }
                    
                    Section(header: Text("Steps")) {
                        ForEach(0..<steps.count, id: \.self) { index in
                            TextField("Step \(index + 1)", text: Binding(
                                get: { self.steps[index] },
                                set: { self.steps[index] = $0 }
                            ))
                        }
                        Button(action: {
                            steps.append("")
                        }) {
                            Label("Add step", systemImage: "plus")
                        }
                    }
                }
            }
            .navigationTitle("New recipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveRecipe()
                    }
                }
            }
        }
    }
    
    func saveRecipe() {
        
        let recipe: MyRecipeModel = .init(title: title, 
                                          description: description,
                                          fromUser: fromUser,
                                          ingredients: ingredients,
                                          steps: steps,
                                          savedBy: [fromUser],
                                          isPublic: isPublic,
                                          creationDate: Date().timeIntervalSince1970)
        
        recipeViewModel.createNewRecipe(with: recipe)
        
        presentationMode.wrappedValue.dismiss()
    }
    
}

#Preview {
    NewRecipeSheet(recipeViewModel: RecipeViewModel())
}
