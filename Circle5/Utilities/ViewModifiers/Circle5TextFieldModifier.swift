//
//  Untitled.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-15.
//
import SwiftUI
struct Circle5TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,24)
    }
}


struct CircularProfileImageView: View {
    var body: some View {
        Image("Circle5")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}
