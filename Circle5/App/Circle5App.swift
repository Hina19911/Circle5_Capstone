//
//  Circle5App.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-14.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("working or nooo")
    return true
  }
}
@main
struct Circle5App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
           ContentView()
        }
    }
    
}
