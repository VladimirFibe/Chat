//
//  ConversationCellViewModel.swift
//  Chat
//
//  Created by MacService on 29.04.2022.
//

import Foundation

struct ConversationCellViewModel {
  let conversation: Conversation
  
  var image: String {
    conversation.profileImageUrl
  }
  
  var name: String {
    conversation.uid
  }
  
  var text: String {
    conversation.text
  }
}
