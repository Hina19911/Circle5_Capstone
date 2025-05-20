//
//  ContentView.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-14.
//
import FirebaseAuth
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                CircleTabView()
            } else {
                LogInView()
            }
        }
    }
}

#Preview {
    ContentView()
}

