//
//  UserCell.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct UserCell: View {
  var body: some View {
      HStack {
        AvatarView(image: Image("profile"), width: 48.0)
        VStack(alignment: .leading, spacing: 4.0) {
          Text("Venom")
            .font(.system(size: 14, weight: .semibold))
          Text("Eddie Brock")
            .font(.system(size: 15))
        }
      }
  }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
