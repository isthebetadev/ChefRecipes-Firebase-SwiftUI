//
//  MyRecipeData.swift
//  chefrecipes
//
//  Created by Ruben on 11/6/24.
//

import SwiftUI

struct MyRecipeDataView: View {
    
    @State var recipe: MyRecipeModel
    
    var body: some View {
        ZStack {
            Color.myGreen.ignoresSafeArea()
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text(recipe.title)
                        .font(.headline)
                    Text(recipe.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Created at \(formattedDate(from: recipe.creationDate))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding([.top], 5)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Category:")
                        .font(.headline)
                    Text(recipe.category)
                        .font(.subheadline)
                        .background(Capsule().fill(Color.mint))
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Status:")
                        .font(.headline)
                    HStack {
                        if recipe.isPublic {
                            Text("public")
                                .font(.subheadline)
                            Image(systemName: "globe")
                        } else {
                            Text("private")
                                .font(.subheadline)
                            Image(systemName: "lock")
                        }
                        
                    }
                }
                .padding([.leading, .bottom, .trailing])
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• \(ingredient)")
                            .font(.subheadline)
                    }
                }
                .padding([.leading, .bottom, .trailing])
                
                VStack(alignment: .leading) {
                    Text("Steps")
                        .font(.headline)
                    
                    ForEach(recipe.steps, id: \.self) { step in
                        Text("• \(step)")
                            .font(.subheadline)
                        
                    }
                }
                .padding([.leading, .bottom, .trailing])
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .padding([.leading, .trailing])
        }
                    
    }
    
    func formattedDate(from timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    MyRecipeDataView(recipe: .init(title: "", description: "", fromUser: "", ingredients: [], steps: [], savedBy: [], isPublic: true, creationDate: Date().timeIntervalSince1970, category: "dinner"))
}
