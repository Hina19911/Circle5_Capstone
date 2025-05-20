//
//  UserCell.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-04-04.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        
        HStack{
            CircularprofileimageView()
            VStack(alignment:.leading){
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fulname)
                
            }
            .font(.footnote)
            Spacer()
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width:100,height: 32)
                .overlay(content: {
                    RoundedRectangle(cornerRadius:10)
                        .stroke( Color(.systemGray4),lineWidth:1)
                })
        }
        .padding(.horizontal)
        
    }
}
#Preview {
    UserCell(user: DeveloperPreview.shared.user)// check it
}
