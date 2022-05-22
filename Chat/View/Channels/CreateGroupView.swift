//
//  CreateGroupView.swift
//  Chat
//
//  Created by MacService on 29.04.2022.
//

import SwiftUI

struct CreateGroupView: View {
  @State private var searchText = ""
  @State private var isEditing = false
  @Environment(\.dismiss) var dismiss
  @Binding var show: Bool
  @ObservedObject var viewModel = SelectGroupMembersViewModel()
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(text: $searchText, isEditing: $isEditing)
          .onTapGesture { isEditing.toggle() }
        
        SelectedGroupMembersView(viewModel: viewModel)
        
        ScrollView {
          VStack {
            ForEach(searchText.isEmpty ? viewModel.selectablePersons : viewModel.filteredPersons(searchText)) { person in
              SelectableUserCell(person: person)
                .onTapGesture {
                  viewModel.selectPerson(person)
                }
            }
          }
        }
        .listStyle(.plain)
      }
      
      .padding()
      .navigationTitle("New Group")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {cancelButton}
        ToolbarItem(placement: .navigationBarTrailing) {nextButton}
      }
    }
  }
  var deselectPerson: some View {
    Button {
      
    } label: {
      Image(systemName: "xmark")
        .font(.system(size: 10))
        .frame(width: 16, height: 16)
        .background(Color.gray, in: Circle())
        .foregroundColor(.white)
    }
    
  }
  
  var cancelButton: some View {
    Button {
      dismiss()
    } label: {
      Text("Cancel")
    }
  }
  var nextButton: some View {
    NavigationLink {
      CreateChannelView(viewModel: CreateChannelViewModel(viewModel.selectedPersons), show: $show)
    } label: {
      Text("Next").bold()
    }

  }
}

//struct CreateGroupView_Previews: PreviewProvider {
//  static var previews: some View {
//    CreateGroupView()
//  }
//}
