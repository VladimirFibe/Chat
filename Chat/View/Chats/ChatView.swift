//
//  ChatView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct ChatView: View {
  @ObservedObject var viewModel: ChatViewModel
  @State var text = ""
  
  init(name: String, uid: String, url: String) {
    viewModel = ChatViewModel(name: name, uid: uid, url: url)

  }
  var body: some View {
    VStack {
      ScrollView {
        ForEach(viewModel.messages) { message in
          MessageView(viewModel: MessageViewModel(message: message))
        }
      }
      ChatInputView(text: $text, action: sendMessage)
    }
    .navigationTitle(viewModel.friendName)
    .navigationBarTitleDisplayMode(.inline)
  }
  func sendMessage() {
    viewModel.sendMessage(text)
    text = ""
  }
}
