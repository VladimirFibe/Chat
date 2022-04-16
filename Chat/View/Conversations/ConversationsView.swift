//
//  ConversationsView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct ConversationsView: View {
  @State private var showNewMessageView = false
  var body: some View {
    ScrollView {
      VStack {
        ForEach(0 ..< 25) { item in
          ConversationCell()
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding()
    }
    .sheet(isPresented: $showNewMessageView) {
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
        .background(Color(.systemBlue), in: Circle())
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
