//
//  ContentView.swift
//  chefrecipes
//
//  Created by Ruben on 5/6/24.
//

import SwiftUI



struct AuthenticationView: View {
    var body: some View {
        VStack {
            Image(systemName: "fork.knife")
                .tint(.black)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(.bottom, 4)
            Text("Hello, Chef Recipes! 👨🏻‍🍳")
                .bold()
        }
    }
}

#Preview {
    AuthenticationView()
}
