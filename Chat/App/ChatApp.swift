//
//  ChatApp.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import SwiftUI
import Firebase

@main
struct ChatApp: App {
//  @StateObject var locationManager = LocationManager()
  @StateObject var authViewModel = AuthViewModel.shared
  init() {
    FirebaseApp.configure()
  }
  var body: some Scene {
    WindowGroup {
//      MainTabView()
//      EditProfileView()
//      AuthView()
//      ChannelChatView()
      AuthOrMainView()
        .environmentObject(authViewModel)
//        .environmentObject(locationManager)
    }
  }
}
