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
        Text("Select")
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding()
          .background(Color.white)
        Text("SELECT YOUR STATUS")
          .foregroundColor(.gray)
          .padding()
        VStack(alignment: .leading, spacing: 30.0) {
          ForEach(0 ..< 25) { item in
            Text("Available")
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        Spacer()
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
