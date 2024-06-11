//
//  MyRecipesView.swift
//  chefrecipes
//
//  Created by Ruben on 10/6/24.
//

import SwiftUI

struct MyRecipesView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @ObservedObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        
        Label("My recipes", systemImage: "fork.knife")
            .font(.title2)
            .bold()
            .padding()
        
        Button(action: { print("Add new recipe") }, label: {
            Label("Add new recipe", systemImage: "plus.circle")
        })
        .buttonStyle(.bordered)
        .padding(.bottom, 10)
        
        
        if profileViewModel.messageError != nil {
            Text(profileViewModel.messageError!)
                .bold()
                .foregroundStyle(.red)
        }
        
        NavigationStack {
            List {
                ForEach(profileViewModel.myRecipes) { recipe in
                    VStack {
                        NavigationLink(value: recipe) {
                            Text("Title: \(recipe.title)")
                        }
                    }
                }
            }
            .navigationDestination(for: MyRecipeModel.self, 
                                   destination:  { recipe in
                                                // the view for show and update recipe
            })
            .task {
                profileViewModel.getMyUserRecipes(userEmail: authenticationViewModel.user!.email)
            }
            
        }
        
    }
    
}

#Preview {
    MyRecipesView(authenticationViewModel: AuthenticationViewModel(), profileViewModel: ProfileViewModel())
}
