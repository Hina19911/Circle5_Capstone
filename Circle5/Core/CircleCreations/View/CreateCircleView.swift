//
//  CreateCircleView.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-22.
//

import SwiftUI

struct CreateCircleView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView()
                    VStack(alignment: .leading, spacing: 4){
                        Text("Blah blah")
                            .fontWeight(.semibold)
                        TextField("Start a post..",text:$caption,axis:.vertical)
                    }
                    .font(.footnote)
                    Spacer()
                    if !caption.isEmpty{
                        Button{
                        caption=""
                    }label:{
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width:12,height: 12)
                            .foregroundColor(.gray)
                    }
                }
                }
                Spacer()
        }
            .padding()
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem( placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem( placement: .navigationBarTrailing){
                    Button("Post"){
                        
                    }
                    .opacity(caption.isEmpty ? 0.5:1.0)
                    .disabled(caption.isEmpty )
                    .font(.subheadline)
                    fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
            
        }
    }
}

#Preview {
    CreateCircleView()
}
