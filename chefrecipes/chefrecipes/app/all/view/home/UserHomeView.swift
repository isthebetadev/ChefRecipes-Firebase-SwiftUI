//
//  UserHomeView.swift
//  chefrecipes
//
//  Created by Ruben on 13/6/24.
//

import SwiftUI

struct UserHomeView: View {
    
    @State var userEmail: String
    
    var body: some View {
        ZStack {
            
            Color.myYellow.ignoresSafeArea()
            
            VStack {
                Text("Wellcome back")
                    .font(.largeTitle)
                    .bold()
                Text("Ready to discover new flavors?")
                    .font(.subheadline)
                    .underline()
                Spacer()
                RecipeOfTheDayView()
                MostSavedRecipesView()
            }
            .padding()
            
        }
    }
}

#Preview {
    UserHomeView(userEmail: "email@test.com")
}
