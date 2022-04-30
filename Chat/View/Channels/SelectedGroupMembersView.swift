//
//  SelectedGroupMembersView.swift
//  Chat
//
//  Created by MacService on 30.04.2022.
//

import SwiftUI

struct SelectedGroupMembersView: View {
    var body: some View {
      ScrollView(.horizontal) {
        HStack {
          ForEach(0 ..< 5) { item in
            VStack {
              AvatarView(url: MOCK_PERSON.profileImageUrl, width: 60)
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
              Text("Кот Матроскин")
                .font(.system(size: 11, weight: .semibold))
                .multilineTextAlignment(.center)
                .lineLimit(2)
            }
            .frame(width: 64)
            .overlay(cancelButton, alignment: .topTrailing)
          }
        }
      }
    }
  var cancelButton: some View {
    Button {
      
    } label: {
      Image(systemName: "xmark")
        .font(.system(size: 10))
        .frame(width: 16, height: 16)
        .background(Color.gray, in: Circle())
        .foregroundColor(.white)
    }

  }
}

struct SelectedGroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedGroupMembersView()
    }
}
