//
//  FeedView.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-17.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    ForEach(0...10, id:\.self){ thread in
                        CircleCell()
                        
                    }
                }
                
            }
            .refreshable {
                print("Debug: Refreshing feed...")
            }
            .navigationTitle(Text("Feed"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    
                }label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FeedView()
        
    }
   
}
