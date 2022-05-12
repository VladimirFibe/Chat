//
//  MainTabView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct MainTabView: View {
  @State var selection = Tabs.Map
  var body: some View {
    NavigationView {
      TabView(selection: $selection) {
        MapView().tabItem { Label("Map", systemImage: "map") }.tag(Tabs.Map)
        ConversationsView().tabItem { Label("Chats", systemImage: "bubble.left") }.tag(Tabs.Chats)
        ChannelsView().tabItem { Label("Channels", systemImage: "bubble.left.and.bubble.right")  }.tag(Tabs.Channels)
        SettingsView().tabItem { Label("Settings", systemImage: "gear")  }.tag(Tabs.Settings)
      }
      .navigationTitle(selection.rawValue)
    }
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}

enum Tabs: String {
  case Map
  case Chats
  case Channels
  case Settings
}
