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
        AvatarView(image: Image("profile"))
        VStack(alignment: .leading) {
          Text("Eddie Brock")
          Text("Hey")
        }
      }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
