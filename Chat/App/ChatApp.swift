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
  @StateObject var authViewModel = AuthViewModel()
  init() {
    FirebaseApp.configure()
  }
  var body: some Scene {
    WindowGroup {
//      MainTabView()
//      EditProfileView()
//      AuthView()
      AuthOrMainView()
        .environmentObject(authViewModel)
    }
  }
}
