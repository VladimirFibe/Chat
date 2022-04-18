//
//  ChatView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct ChatView: View {
  @State var text = ""
  var body: some View {
    VStack {
      ScrollView {
        ForEach(0 ..< 25) { item in
          MessageView(me: item % 2 == 0)
        }
      }
      ChatInputView(text: $text, action: sendMessage)
    }
    .navigationTitle("venom")
    .navigationBarTitleDisplayMode(.inline)
  }
  func sendMessage() {
    print(text)
    text = ""
  }
}

struct ChatView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView()
  }
}
