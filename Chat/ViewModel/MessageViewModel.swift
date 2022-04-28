//
//  MessageViewModel.swift
//  Chat
//
//  Created by MacService on 28.04.2022.
//

import SwiftUI

struct MessageViewModel {
  let message: Message
  var url: String {
    me ? message.toUrl : message.fromUrl
  }
  
  var name: String {
    me ? message.toName : message.fromName
  }
  
  var currentUid: String {
    AuthViewModel.shared.person.id ?? ""
  }
  
  var me: Bool {
    message.fromId == currentUid
  }
  
  var text: String {
    message.text
  }
}

