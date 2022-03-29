//
//  SettingsView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct SettingsView: View {
  var body: some View {
    VStack(spacing: 20.0) {
      SettingsHeaderView()
      VStack(spacing: 0.0) {
        SettingsCell(color: .blue, title: "Account", image: "key.fill")
        SettingsCell(color: .red, title: "Notifications", image: "bell.fill")
        SettingsCell(color: .yellow, title: "Starred Messages", image: "star.fill")
          .padding(.bottom, 8)
      }
      .background(Color.white)
      Button {
        
      } label: {
        Text("Log Out")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.red)
      }
      .padding(.vertical)
      .frame(maxWidth: .infinity)
      .background(Color.white)

      Spacer()
    }
    .padding(.vertical)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color(.systemGroupedBackground))
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
