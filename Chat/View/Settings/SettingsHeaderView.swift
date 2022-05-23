//
//  SettingsHeaderView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct SettingsHeaderView: View {
  let person: Person
  
  var body: some View {
    HStack {
      AvatarView(url: person.profileImageUrl)

      VStack(alignment: .leading, spacing: 4) {
        Text(person.fullname)
          .font(.system(size: 18))
          .foregroundColor(.black)
        Text(person.status.title)
          .font(.system(size: 14))
          .foregroundColor(.gray)
      }
      Spacer()
    }
    .frame(height: 80)
    .padding()
    .background(Color.white)
  }
}

struct SettingsHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsHeaderView(person: Person())
  }
}
