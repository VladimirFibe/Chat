//
//  MessageView.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.04.2022.
//

import SwiftUI

struct MessageView: View {
  let message: Message
    var body: some View {
      HStack {
        if message.me {
          Spacer()
          Text(message.text)
            .padding(12)
            .background(Color.systemBlue)
            .foregroundColor(.white)
            .font(.system(size: 15))
            .clipShape(ChatBubble(me: message.me))
            .padding(.trailing)
            .padding(.leading, 100)
        } else {
          HStack(alignment: .bottom, spacing: 10) {
            AvatarView(url: "", width: 32)
            Text(message.text)
              .padding(12)
              .background(Color.systemGray5)
              .font(.system(size: 15))
              .clipShape(ChatBubble(me: message.me))
          }
          .padding(.leading)
          .padding(.trailing, 80)
          Spacer()
        }
      }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
      MessageView(message: Message())
    }
}
