//
//  MessageView.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.04.2022.
//

import SwiftUI

struct MessageView: View {
  var me: Bool {
    true
  }
  let message: Message
  let url: String
    var body: some View {
      HStack {
        if me {
          Spacer()
          Text(message.text)
            .padding(12)
            .background(Color.systemBlue)
            .foregroundColor(.white)
            .font(.system(size: 15))
            .clipShape(ChatBubble(me: me))
            .padding(.trailing)
            .padding(.leading, 100)
        } else {
          HStack(alignment: .bottom, spacing: 10) {
            AvatarView(url: url, width: 32)
            Text(message.text)
              .padding(12)
              .background(Color.systemGray5)
              .font(.system(size: 15))
              .clipShape(ChatBubble(me: me))
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
