//
//  ConversationCell.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct ConversationCell: View {
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        AvatarView(url: "")
        VStack(alignment: .leading, spacing: 4.0) {
          Text("Eddie Brock")
            .font(.system(size: 14, weight: .semibold))
          Text("This is some test message for now...")
            .font(.system(size: 15))
        }
      }
      Divider()
    }
  }
}

struct ConversationCell_Previews: PreviewProvider {
  static var previews: some View {
    ConversationCell()
  }
}
