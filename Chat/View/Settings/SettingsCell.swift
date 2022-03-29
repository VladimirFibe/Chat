//
//  SettingsCell.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct SettingsCell: View {
  let viewModel: SettingsCellViewModel
  var body: some View {
    VStack {
      HStack {
        Image(systemName: viewModel.image)
          .resizable()
          .scaledToFit()
          .frame(width: 22, height: 22)
          .padding(6)
          .background(viewModel.color)
          .foregroundColor(.white)
          .cornerRadius(6)
        
        Text(viewModel.title)
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
    SettingsCell(viewModel: .account)
  }
}
