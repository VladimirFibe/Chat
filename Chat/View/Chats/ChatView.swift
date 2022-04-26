//
//  ChatView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct ChatView: View {
  private let friend: Person
  @ObservedObject var viewModel: ChatViewModel
  @State var text = ""
  
  init(friend: Person) {
    self.friend = friend
    self.viewModel = ChatViewModel(friend: friend)
  }
  var body: some View {
    VStack {
      ScrollView {
        ForEach(viewModel.messages) { message in
          MessageView(message: message, url: friend.profileImageUrl)
        }
      }
      ChatInputView(text: $text, action: sendMessage)
    }
    .navigationTitle(friend.fullname)
    .navigationBarTitleDisplayMode(.inline)
  }
  func sendMessage() {
    viewModel.sendMessage(text)
    text = ""
  }
}
//
//struct ChatView_Previews: PreviewProvider {
//  static var previews: some View {
//    ChatView(friend: .constant(Person()))
//  }
//}
