//
//  CreateGroupView.swift
//  Chat
//
//  Created by MacService on 29.04.2022.
//

import SwiftUI

struct CreateGroupView: View {
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(text: .constant(""),
                  isEditing: .constant(true))
        SelectedGroupMembersView()
        List {
          ForEach(0 ..< 5) { item in
            UserCell(person: MOCK_PERSON)
          }
        }
        .listStyle(.plain)
      }
      .padding()
      .navigationTitle("Group")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {cancelButton}
        ToolbarItem(placement: .navigationBarTrailing) {nextButton}
      }
    }
  }
  var cancelButton: some View {
    Button {
      
    } label: {
      Text("Cancel")
    }
  }
  var nextButton: some View {
    Button {
      
    } label: {
      Text("Next").bold()
    }
  }
}

struct CreateGroupView_Previews: PreviewProvider {
  static var previews: some View {
    CreateGroupView()
  }
}
