//
//  CircleTabView.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-15.
//

import SwiftUI

struct CircleTabView: View {
    @State private var selectedTab = 0
    @State private var showCreateCircleView = false
    var body: some View {
        TabView(selection:$selectedTab){
            FeedView()
                .tabItem{
                    Image(systemName: selectedTab == 0 ? "house.fill" :"house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    }
                .onAppear{ selectedTab = 0}
                        .tag(0)
                    
                
            ExploreView()
                .tabItem{
                    Image(systemName:"magnifyingglass")
                }
                .onAppear{ selectedTab = 1}
                        .tag(1)
           Text("")
                .tabItem{
                    Image(systemName:"plus")
                }
                .onAppear{ selectedTab = 2}
                        .tag(2)
            ActivityView()
                .tabItem{
                    Image(systemName: selectedTab == 0 ? "heart.fill" :"heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear{ selectedTab = 3}
                        .tag(3)
            CurrentUserProfileView()
                .tabItem{
                    Image(systemName: selectedTab == 4 ? "person.fill" :"person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear{ selectedTab = 4}
                        .tag(4)
        }
        .onChange(of: selectedTab, perform:  {  newValue in
            showCreateCircleView = selectedTab == 2
        })

        .sheet(
            isPresented: $showCreateCircleView,
            onDismiss: {selectedTab = 0},
            content:{
                CreateCircleView()
            })
            
        .tint(.black)
    }
}

#Preview {
    CircleTabView()
}
