//
//  ConversationCell.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct ConversationCell: View {
  let viewModel: ConversationCellViewModel
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        AvatarView(url: viewModel.image)
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
