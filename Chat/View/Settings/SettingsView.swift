//
//  SettingsView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct SettingsView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  var body: some View {
    VStack(spacing: 20.0) {
      NavigationLink(destination: EditProfileView()) {
        SettingsHeaderView(person: viewModel.person)
      }
      VStack(spacing: 0.0) {
        ForEach(SettingsCellViewModel.allCases) { viewModel in
          SettingsCell(viewModel: viewModel)
        }
        .padding(.bottom, 8)
      }
      .background(Color.white)
      Button {
        viewModel.signout()
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
    .background(Color.systemGroupedBackground)
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
      .environmentObject(AuthViewModel.shared)
  }
}
