//
//  ChatBubble.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.04.2022.
//

import SwiftUI

struct ChatBubble: Shape {
  var me: Bool
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, me ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
    return Path(path.cgPath)
  }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
      ChatBubble(me: true)
        .frame(width: 200, height: 100)
    }
}
