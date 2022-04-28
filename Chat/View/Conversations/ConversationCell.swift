//
//  ConversationCell.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct ConversationCell: View {
  let viewModel: MessageViewModel
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        AvatarView(url: viewModel.url)
        VStack(alignment: .leading, spacing: 4.0) {
          Text(viewModel.name)
            .font(.system(size: 14, weight: .semibold))
          Text(viewModel.text)
            .font(.system(size: 15))
        }
      }
      Divider()
    }
  }
}
//
//struct ConversationCell_Previews: PreviewProvider {
//  static var previews: some View {
//    ConversationCell(person: Person())
//  }
//}
