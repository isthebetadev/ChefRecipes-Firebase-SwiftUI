//
//  NewRecipeSheet.swift
//  chefrecipes
//
//  Created by Ruben on 11/6/24.
//

import SwiftUI

struct NewRecipeSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var fromUser: String = "" // get the user in the call
    @State private var ingredients: [String] = []
    @State private var steps: [String] = []
    
    var body: some View {
        Form {
            Section(header: Text("Recipe details")) {
                VStack {
                    
                }
            }
        }
        .navigationTitle("New recipe")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Guardar") {
                    let newRecipe = MyRecipeModel(title: title,
                                                  description: description,
                                                  fromUser: fromUser,
                                                  ingredients: ingredients,
                                                  steps: steps,
                                                  savedBy: [])
                    // call to view model to save
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
                        
    }
}

#Preview {
    NewRecipeSheet()
}
