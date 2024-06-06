//
//  DismissView.swift
//  chefrecipes
//
//  Created by Ruben on 6/6/24.
//

import SwiftUI

struct DismissView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {
            Spacer()
            Button(action: { dismiss() }, label: {
                Label("Close", systemImage: "xmark")
                    .labelsHidden()
            })
        }
        .buttonStyle(.bordered)
        .padding(.trailing, 10)
        .tint(.black)
    }
}

#Preview {
    DismissView()
}
