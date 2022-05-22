//
//  ConversationsView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct ConversationsView: View {
  @ObservedObject var viewModel = ConversationsViewModel()
  @State var friend: Person?
  @State private var showNewMessageView = false
  @State private var showChatView = false
  var body: some View {
    ScrollView {
      VStack {
        ForEach(viewModel.conversations) { conversation in
          NavigationLink(destination: ChatView(name: conversation.uid, uid: conversation.id ?? "", url: conversation.profileImageUrl)) {
            ConversationCell(viewModel: ConversationCellViewModel(conversation: conversation))
          }
        }
        if let friend = friend, let id = friend.id {
          NavigationLink(isActive: $showChatView) {
            ChatView(name: friend.fullname, uid: id, url: friend.profileImageUrl)
          } label: {
            EmptyView()
          }
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding()
    }
    .sheet(isPresented: $showNewMessageView, onDismiss: {
      showChatView.toggle()
    }) {
      NewMessageView(friend: $friend)
    }
    .overlay(alignment: .bottomTrailing) {
      BlueButton(show: $showNewMessageView)
    }
  }
}

struct ConversationsView_Previews: PreviewProvider {
  static var previews: some View {
    ConversationsView()
  }
}
