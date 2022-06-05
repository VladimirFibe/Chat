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
      if let image = viewModel.image {
        VStack(alignment: .leading) {
          if let name = viewModel.message.name {
            Text(name)
              .foregroundColor(.gray)
              .font(.system(size: 14))
              .padding(.leading, 44)
          }
          HStack(alignment: .bottom, spacing: 10) {
            AvatarView(url: image, width: 32)
            Text(viewModel.text)
              .padding(12)
              .background(Color.systemGray5)
              .font(.system(size: 15))
              .cornerRadius(16, corners: [.topLeft, .topRight, .bottomRight])
          }
          .padding(.leading)
          .padding(.trailing, 80)
        }
        Spacer()
      } else {
        Spacer()
        Text(viewModel.text)
          .padding(12)
          .background(Color.systemBlue)
          .foregroundColor(.white)
          .font(.system(size: 15))
          .cornerRadius(16, corners: [.topLeft, .topRight, .bottomLeft])
          .padding(.trailing)
          .padding(.leading, 100)
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
