//
//  ProfileView.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-22.
//
import SwiftUI

struct ProfileView: View {
    let user: User
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fulname)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(user.username)
                                .font(.subheadline)
                        }
                        if let bio = user.bio {
                            Text(bio)
                                .font(.footnote)
                        }
                        
                        Text("2 followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    CircularProfileImageView()
                }
                
                Button(action: {
                    // Action goes here
                }) {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                VStack {
                    HStack {
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 180, height: 1)
                                } else {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 180, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                    
                    LazyVStack {
                        ForEach(0...10, id: \.self) { thread in
                            CircleCell()
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    AuthService.shared.signOut()
                }) {
                    Image(systemName: "line.3.horizontal")
                }
            }
        }
        .navigationTitle("Profile") // optional, helps render toolbar
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}


/*import SwiftUI
 
 struct ProfileView: View {
 @State private var selectedFilter: ProfileThreadFilter = .threads
 @Namespace var animation
 private var filterBarWidth:CGFloat {
 let count = CGFloat(ProfileThreadFilter.allCases.count)
 return UIScreen.main.bounds.width/count - 16 }
 }
 var body: some View {
 // ✅ Fixed spelling of "NavigationStack"
 ScrollView(showsIndicators: false) {
 VStack(spacing: 20) {
 HStack(alignment: .top) {
 VStack(alignment: .leading, spacing: 12) { // ✅ Added a comma after alignment
 // Full name and username
 VStack(alignment: .leading, spacing: 4) { // ✅ Added a comma after alignment
 Text("Mickey")
 .font(.title2)
 .fontWeight(.semibold)
 Text("@Mickey") // ✅ Changed duplicate name to username format
 .font(.title2)
 .fontWeight(.semibold)
 }
 Text("Formula 1 driver for Scuderia") // ✅ Fixed indentation
 .font(.footnote)
 Text("2 followers")
 .font(.caption)
 .foregroundColor(.gray)
 }
 Spacer()
 CircularProfileImageView() // ✅ Assuming this is a custom SwiftUI View
 }
 
 // Profile Action Button
 Button(action: {
 print("Follow button tapped") // ✅ Added action for button
 }) {
 Text("Follow") // ✅ Added label text
 .font(.subheadline)
 .fontWeight(.semibold)
 .foregroundColor(.white)
 .frame(width: 120, height: 40)
 .background(Color.black)
 .cornerRadius(8)
 }
 }
 .padding() // ✅ Added padding for better layout
 }
 }
 
 }*/
