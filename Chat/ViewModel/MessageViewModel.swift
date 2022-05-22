//
//  MessageViewModel.swift
//  Chat
//
//  Created by MacService on 28.04.2022.
//

import SwiftUI

struct MessageViewModel {
  let message: Message
  var image: String? {
    message.profileImageUrl
  }
  
  var uid: String {
    message.uid
  }
  
  var currentUid: String {
    AuthViewModel.shared.person.id ?? ""
  }
  
  var text: String {
    message.text
  }
}

