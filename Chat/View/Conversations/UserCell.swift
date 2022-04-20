//
//  UserCell.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct UserCell: View {
  var person: Person
  var body: some View {
    HStack {
      AvatarView(url: person.profileImageUrl, width: 48.0)
      VStack(alignment: .leading, spacing: 4.0) {
        Text(person.username)
          .font(.system(size: 14, weight: .semibold))
        Text(person.fullname)
          .font(.system(size: 15))
      }
      Spacer()
    }
  }
}
//
//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
