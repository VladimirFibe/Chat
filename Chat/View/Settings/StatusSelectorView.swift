//
//  StatusSelectorView.swift
//  Chat
//
//  Created by Vladimir Fibe on 15.04.2022.
//

import SwiftUI

struct StatusSelectorView: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 20.0) {
        Text("CURRENTLY SET TO")
          .foregroundColor(.gray)
          .padding()
        StatusCell(item: .available)
        Text("SELECT YOUR STATUS")
          .foregroundColor(.gray)
          .padding()
        VStack(alignment: .leading, spacing: 0) {
          ForEach(StatusViewModel.allCases.filter{$0 != .notConfigured}) { item in
            Button(action: {
              print("\(item.title)")
            }) {
              StatusCell(item: item)
            }
            .accentColor(.black)
          }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    .background(Color(.systemGroupedBackground))
    .navigationTitle("Status")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct StatusSelectorView_Previews: PreviewProvider {
  static var previews: some View {
    StatusSelectorView()
  }
}

struct StatusCell: View {
  let item: StatusViewModel
  var body: some View {
    Text(item.title)
      .frame(height: 56)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal)
      .background(Color.white)
  }
}
