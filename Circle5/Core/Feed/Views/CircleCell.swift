//
//  CircleCell.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-22.
//

import SwiftUI

struct CircleCell: View {
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing:12){ CircularprofileimageView()
                
                VStack(alignment:.leading,spacing: 4){
                    HStack {
                        Text("circle")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Button {
                            
                            
                        } label:{
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    Text("I'm the champion")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    HStack(spacing:16){
                        Button{
                            
                        } label:{
                            Image(systemName: "heart")
                            
                        }
                        Button{
                            
                        } label:{
                            Image(systemName: "bubble.right")
                            
                        }
                        Button{
                            
                        } label:{
                            Image(systemName: "arrow.rectanglepath")
                            
                        }
                        Button{
                            
                        } label:{
                            Image(systemName: "paperplane")
                            
                        }
                        
                    }.foregroundColor(.black)
                        .padding(.vertical,8)
                }
                
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    CircleCell()
}

