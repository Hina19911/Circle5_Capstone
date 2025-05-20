//
//  CircularprofileimageView.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-04-04.
//

import SwiftUI

struct CircularprofileimageView: View {
    var body: some View {
        Image("Circle5")
            .resizable()
            .scaledToFit()
            .frame(width:40,height: 40)
            .clipShape(Circle())
    }}

#Preview {
    CircularprofileimageView()
}
