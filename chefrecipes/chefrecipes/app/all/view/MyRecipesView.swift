//
//  MyRecipesView.swift
//  chefrecipes
//
//  Created by Ruben on 10/6/24.
//

import SwiftUI

struct MyRecipesView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @ObservedObject var recipeViewModel: RecipeViewModel
    @State private var isPresentingNewRecipeSheet = false
    
    var body: some View {
        
        Label("My recipes", systemImage: "fork.knife")
            .font(.title2)
            .bold()
            .padding()
        
        Button(action: {
            print("showing add new recipe sheet")
            isPresentingNewRecipeSheet = true
        }, label: {
            Label("Add new recipe", systemImage: "plus.circle")
        })
        .buttonStyle(.bordered)
        .padding(.bottom, 10)
        
        
        if recipeViewModel.messageError != nil {
            Text(recipeViewModel.messageError!)
                .bold()
                .foregroundStyle(.red)
        }
        
        NavigationStack {
            List {
                ForEach(recipeViewModel.myRecipes) { recipe in
                    VStack {
                        NavigationLink(value: recipe) {
                            Text(recipe.title)
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            recipeViewModel.deleteRecipe(recipe: recipe)
                        }, label: {
                            Label("Delete", systemImage: "trash.fill")
                        })
                        .tint(.red)
                        
                    }
                }
            }
            .navigationDestination(for: MyRecipeModel.self, 
                                   destination:  { recipe in MyRecipeDataView(recipe: recipe)})
            .task {
                recipeViewModel.getMyUserRecipes(userEmail: authenticationViewModel.user!.email)
            }
            .sheet(isPresented: $isPresentingNewRecipeSheet, content: {
                NewRecipeSheet()
            })
            
        }
        
    }
    
}

#Preview {
    MyRecipesView(authenticationViewModel: AuthenticationViewModel(), recipeViewModel: RecipeViewModel())
}
