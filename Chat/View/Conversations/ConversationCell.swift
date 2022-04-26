//
//  ConversationCell.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct ConversationCell: View {
  var person: Person
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        AvatarView(url: person.profileImageUrl)
        VStack(alignment: .leading, spacing: 4.0) {
          Text(person.fullname)
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
    ConversationCell(person: Person())
  }
}
