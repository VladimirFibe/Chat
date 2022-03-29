//
//  SettingsCell.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct SettingsCell: View {
  let color: Color
  let title: String
  let image: String
  var body: some View {
    VStack {
      HStack {
        Image(systemName: image)
          .resizable()
          .scaledToFit()
          .frame(width: 22, height: 22)
          .padding(6)
          .background(color)
          .foregroundColor(.white)
          .cornerRadius(6)
        
        Text(title)
          .font(.system(size: 15))
        Spacer()
        Image(systemName: "chevron.right")
          .foregroundColor(.gray)
      }
      Divider()
        .padding(.leading)
    }
    .padding([.top, .horizontal])
  }
}

struct SettingsCell_Previews: PreviewProvider {
  static var previews: some View {
    SettingsCell(color: .yellow, title: "Star", image: "star.fill")
  }
}
