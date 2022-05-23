//
//  StatusSelectorView.swift
//  Chat
//
//  Created by Vladimir Fibe on 15.04.2022.
//

import SwiftUI

struct StatusSelectorView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 20.0) {
        Text("CURRENTLY SET TO")
          .foregroundColor(.gray)
          .padding()
        StatusCell(status: viewModel.person.status)
        Text("SELECT YOUR STATUS")
          .foregroundColor(.gray)
          .padding()
        VStack(alignment: .leading, spacing: 0) {
          ForEach(UserStatus.allCases.filter{$0 != .notConfigured}) { status in
            Button(action: {
              viewModel.updateStatus(status)
            }) {
              StatusCell(status: status)
            }
          }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    .background(Color.systemGroupedBackground)
    .navigationTitle("Status")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct StatusSelectorView_Previews: PreviewProvider {
  static var previews: some View {
    StatusSelectorView()
      .environmentObject(AuthViewModel.shared)
  }
}

struct StatusCell: View {
  let status: UserStatus
  var body: some View {
    Text(status.title)
      .frame(height: 56)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal)
      .background(Color.white)
  }
}
