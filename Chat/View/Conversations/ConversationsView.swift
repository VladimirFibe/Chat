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
        ForEach(viewModel.messages) { message in
          NavigationLink(destination: ChatView(name: message.name, uid: message.uid, url: message.url)) {
            ConversationCell(viewModel: MessageViewModel(message: message))
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
      squarePencil
    }
  }

  var squarePencil: some View {
    Button {
      showNewMessageView.toggle()
    } label: {
      Image(systemName: "square.and.pencil")
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .padding()
        .background(Color.systemBlue, in: Circle())
        .tint(.white)
        .padding()
    }

  }
}

struct ConversationsView_Previews: PreviewProvider {
  static var previews: some View {
    ConversationsView()
  }
}
