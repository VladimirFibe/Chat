//
//  SettingsHeaderView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct SettingsHeaderView: View {
  var body: some View {
    HStack {
      Image("profile")
        .resizable()
        .scaledToFill()
        .frame(width: 64, height: 64)
        .clipShape(Circle())
        .padding(.leading)
      VStack(alignment: .leading, spacing: 4) {
        Text("Eddie Brock")
          .font(.system(size: 18))
        Text("Available")
          .font(.system(size: 14))
          .foregroundColor(.gray)
      }
      Spacer()
    }
    .frame(height: 80)
    .background(Color.white)
  }
}

struct SettingsHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsHeaderView()
  }
}
