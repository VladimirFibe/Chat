//
//  ChannelCell.swift
//  Chat
//
//  Created by MacService on 29.04.2022.
//

import SwiftUI

struct ChannelCell: View {
  let channel: Channel
  var url: String {
    channel.imageUrl ?? "https://i.pinimg.com/736x/84/d4/b6/84d4b6b6302d87c8b21706c6347be558.jpg"
  }
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        AvatarView(url: url)
        VStack(alignment: .leading, spacing: 4.0) {
          Text(channel.name)
            .font(.system(size: 14, weight: .semibold))
          Text(channel.lastMessage)
            .font(.system(size: 15))
        }
      }
      Divider()
    }
  }
}

//struct ChannelCell_Previews: PreviewProvider {
//  static var previews: some View {
//    ChannelCell()
//      .padding()
//  }
//}
