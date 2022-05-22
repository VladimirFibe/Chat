//
//  ChannelChatView.swift
//  Chat
//
//  Created by MacService on 21.05.2022.
//

import SwiftUI

struct ChannelChatView: View {
  @ObservedObject var viewModel: ChannelChatViewModel
  @State var text = ""
  var body: some View {
    VStack {
      ScrollView {
        ForEach(viewModel.messages) { message in
          MessageView(viewModel: MessageViewModel(message: message))
        }
      }
      ChatInputView(text: $text, action: sendMessage)
    }
    .navigationTitle(viewModel.channel.name)
    .navigationBarTitleDisplayMode(.inline)
  }
  func shareButton() {
    let message = "В Алматы облачно, 20 градусов тепла"
    let activityController = UIActivityViewController(
      activityItems: [message],
      applicationActivities: nil)
    UIApplication
      .shared
      .connectedScenes
      .compactMap { $0 as? UIWindowScene}
      .flatMap { $0.windows }
      .first { $0.isKeyWindow}?
      .rootViewController!
      .present(activityController, animated: true, completion: nil)
  }
  func sendMessage() {
    viewModel.sendChannelMessage(text)
    text = ""
  }
}

//struct ChannelChatView_Previews: PreviewProvider {
//  static var previews: some View {
//    ChannelChatView()
//  }
//}
