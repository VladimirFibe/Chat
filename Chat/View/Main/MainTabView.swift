import SwiftUI

struct MainTabView: View {
  @State var selection = Tabs.Settings
  var body: some View {
    NavigationView {
      TabView(selection: $selection) {
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
      .environmentObject(AuthViewModel.shared)
  }
}

enum Tabs: String {
  case Chats
  case Channels
  case Settings
}
