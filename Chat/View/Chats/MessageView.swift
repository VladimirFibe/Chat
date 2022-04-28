//
//  MessageView.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.04.2022.
//

import SwiftUI

struct MessageView: View {
  let viewModel: MessageViewModel
  var body: some View {
    HStack {
      if viewModel.me {
        Spacer()
        Text(viewModel.text)
          .padding(12)
          .background(Color.systemBlue)
          .foregroundColor(.white)
          .font(.system(size: 15))
          .clipShape(ChatBubble(me: viewModel.me))
          .padding(.trailing)
          .padding(.leading, 100)
      } else {
        HStack(alignment: .bottom, spacing: 10) {
          AvatarView(url: viewModel.url, width: 32)
          Text(viewModel.text)
            .padding(12)
            .background(Color.systemGray5)
            .font(.system(size: 15))
            .clipShape(ChatBubble(me: viewModel.me))
        }
        .padding(.leading)
        .padding(.trailing, 80)
        Spacer()
      }
    }
  }
}
//
//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//      MessageView(message: Message())
//    }
//}
