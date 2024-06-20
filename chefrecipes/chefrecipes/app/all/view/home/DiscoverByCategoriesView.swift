//
//  SwiftUIView.swift
//  chefrecipes
//
//  Created by Ruben on 20/6/24.
//

import SwiftUI

struct DiscoverByCategoriesView: View {
    
    @ObservedObject var viewModel: RecipeViewModel
    let categoriesImage: [String] = [
        "breakfast",
        "lunch",
        "snack",
        "dinner"
    ]
    
    var body: some View {

            VStack {
                Text("🥑 Discover them by categories")
                    .font(.title2)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(categoriesImage, id:  \.self) { image in
                            NavigationLink(destination: RecipesForACategoryView(viewModel: viewModel, category: image)) {
                                VStack {
                                    Image(image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 120, height: 120)
                                        .clipped()
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                    Text(image)
                                        .font(.caption)
                                        .italic()
                                }
                                
                            }
                        }
                    }
                }
            }
            .padding([.leading, .bottom, .trailing])
        
        
    }
}

#Preview {
    DiscoverByCategoriesView(viewModel: RecipeViewModel())
}
