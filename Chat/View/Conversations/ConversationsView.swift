//
//  ConversationsView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct ConversationsView: View {
  @State private var showNewMessageView = false
  @State private var showChatView = false
  var body: some View {
    ScrollView {
      VStack {
        ForEach(0 ..< 25) { item in
          NavigationLink(destination: ChatView()) {
            ConversationCell()
          }
        }
        NavigationLink(isActive: $showChatView) {
          ChatView()
        } label: {
          EmptyView()
        }

      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding()
    }
    .sheet(isPresented: $showNewMessageView, onDismiss: {
      showChatView.toggle()
    }) {
      NewMessageView()
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
