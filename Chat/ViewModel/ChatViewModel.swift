//
//  ChatViewModel.swift
//  Chat
//
//  Created by Vladimir Fibe on 18.04.2022.
//

import Foundation

class ChatViewModel: ObservableObject {
  @Published var messages = Message.messages
  func sendMessage(_ text: String) {
    if !text.isEmpty {
      let message = Message(text: text)
      messages.append(message)
    }
  }
}
