//
//  SearchBar.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.04.2022.
//

import SwiftUI

struct SearchBar: View {
  @Binding var text: String
  @Binding var isEditing: Bool
  var body: some View {
    HStack {
      TextField("Search...", text: $text)
        .padding(.vertical, 8)
        .padding(.horizontal, 32)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .overlay(alignment: .leading, content: {
          Image(systemName: "magnifyingglass")
            .frame(width: 24, height: 24)
            .foregroundColor(.gray)
            .padding(.leading, 4)
      })
      if isEditing {
        Button {
          isEditing = false
          text = ""
          UIApplication.shared.endEditing()
        } label: {
          Text("Cancel")
            .tint(.black)
            .padding(8)
        }
        .transition(.move(edge: .trailing))
      }
    }
  }
}

struct SearchBar_Previews: PreviewProvider {
  static var previews: some View {
    SearchBar(text: .constant(""), isEditing: .constant(false))
      .padding(.horizontal)
  }
}
