//
//  SelectedGroupMembersView.swift
//  Chat
//
//  Created by MacService on 30.04.2022.
//

import SwiftUI

struct SelectedGroupMembersView: View {
  @ObservedObject var viewModel: SelectGroupMembersViewModel
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        ForEach(viewModel.selectedPersons) { personCell($0) }
      }
    }
  }
  func personCell(_ person: SelectablePerson) -> some View {
    VStack {
      AvatarView(url: person.profileImageUrl, width: 60)
        .shadow(color: .gray, radius: 4, x: 0, y: 2)
      Text(person.fullname)
        .font(.system(size: 11, weight: .semibold))
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
    .frame(width: 64)
    .overlay(
      Button {
        viewModel.selectPerson(person)
      } label: {
        Image(systemName: "xmark")
          .font(.system(size: 10))
          .frame(width: 16, height: 16)
          .background(Color.gray, in: Circle())
          .foregroundColor(.white)
      }
      , alignment: .topTrailing)
  }

}

struct SelectedGroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedGroupMembersView(viewModel: SelectGroupMembersViewModel())
    }
}
