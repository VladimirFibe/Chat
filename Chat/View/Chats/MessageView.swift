//
//  MessageView.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.04.2022.
//

import SwiftUI

struct MessageView: View {
  var me: Bool
    var body: some View {
      HStack {
        if me {
          Spacer()
          Text("Ты всегда будешь меня любить?")
            .padding(12)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .font(.system(size: 15))
            .clipShape(ChatBubble(me: me))
            .padding(.trailing)
            .padding(.leading, 100)
        } else {
          HStack(alignment: .bottom, spacing: 10) {
            AvatarView(image: Image("profile"), width: 32)
            Text("Бла бла бла")
              .padding(12)
              .background(Color(.systemGray5))
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

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
      MessageView(me: true)
    }
}
