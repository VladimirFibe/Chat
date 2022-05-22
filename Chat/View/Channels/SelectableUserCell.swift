//
//  SelectableUserCell.swift
//  Chat
//
//  Created by MacService on 01.05.2022.
//

import SwiftUI

struct SelectableUserCell: View {
  let person: SelectablePerson
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
      checkButton
    }
  }
  var checkButton: some View {
    Image(systemName: person.selectedImage )
        .font(.system(size: 20))
        .foregroundColor(person.color)
  }
}

struct SelectableUserCell_Previews: PreviewProvider {
  static var previews: some View {
    SelectableUserCell(person: SelectablePerson(person: MOCK_PERSON))
      .padding(.horizontal)
  }
}
