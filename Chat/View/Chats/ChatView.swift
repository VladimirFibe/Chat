//
//  ChatView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct ChatView: View {
  @ObservedObject var viewModel = ChatViewModel()
  @State var text = ""
  var body: some View {
    VStack {
      ScrollView {
        ForEach(viewModel.messages) { message in
          MessageView(message: message)
        }
      }
      ChatInputView(text: $text, action: sendMessage)
    }
    .navigationTitle("venom")
    .navigationBarTitleDisplayMode(.inline)
  }
  func sendMessage() {
    viewModel.sendMessage(text)
    text = ""
  }
}

struct ChatView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView()
  }
}
