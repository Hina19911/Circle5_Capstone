import SwiftUI

/*struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false*/
struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    @State private var selectedFilter: ProfileThreadFilter = .threads // ✅ Missing before
    @Namespace var animation // ✅ Missing before
    private var currentUser:User?{
        return viewModel.currentUser
    }
var body: some View {
    NavigationStack {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.fulname ?? "")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(currentUser?.username ?? "")
                                .font(.subheadline)
                        }
                        if let bio = currentUser?.bio {
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
                    showEditProfile = true
                    // Action goes here
                }) {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 350, height: 32)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        )
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
        .sheet(isPresented: $showEditProfile, content:{ EditProfileView()
            .environmentObject(viewModel)})
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
}

#Preview {
    CurrentUserProfileView()
}
