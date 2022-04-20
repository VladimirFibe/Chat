//
//  NewMessageView.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct NewMessageView: View {
  @Environment(\.dismiss) var dismiss
  @State private var searchText = ""
  @State private var isEditing = false
  @ObservedObject var viewModel = NewMessageViewModel()
    var body: some View {
      ScrollView {
        SearchBar(text: $searchText, isEditing: $isEditing)
          .onTapGesture { isEditing.toggle() }
          .padding()
        VStack(alignment: .leading) {
          ForEach(viewModel.persons) { person in
            Button(action: {
              dismiss()
            }) {
              UserCell(person: person)
                .tint(.black)
            }
          }
        }
        .padding()
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
