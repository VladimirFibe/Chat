//
//  MainTabView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct MainTabView: View {
  @State var selection = 0
    var body: some View {
      NavigationView {
        TabView(selection: $selection) {
          ConversationsView().tabItem { Label("Chats", systemImage: "bubble.left") }.tag(0)
          ChannelsView().tabItem { Label("Channels", systemImage: "bubble.left.and.bubble.right")  }.tag(1)
          SettingsView().tabItem { Label("Settings", systemImage: "gear")  }.tag(2)
        }
      }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
