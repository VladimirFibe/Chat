import SwiftUI
import Firebase

@main
struct ChatApp: App {
  init() {
    FirebaseApp.configure()
  }
  var body: some Scene {
    WindowGroup {
      Text("Hi!")
    }
  }
}
