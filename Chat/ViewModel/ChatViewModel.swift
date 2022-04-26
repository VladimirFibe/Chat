//
//  ChatViewModel.swift
//  Chat
//
//  Created by Vladimir Fibe on 18.04.2022.
//

import Firebase

class ChatViewModel: ObservableObject {
  @Published var messages = [Message]()
  let friend: Person
  init(friend: Person) {
    self.friend = friend
  }
  func sendMessage(_ text: String) {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
    guard let friendUid = friend.id else { return }
        
    let currentRef = COLLECTION_MESSAGES
      .document(currentUid)
      .collection(friendUid)
      .document()
    
    let friendRef = COLLECTION_MESSAGES
      .document(friendUid)
      .collection(currentUid)
    
    let messageId = currentRef.documentID
    let data: [String: Any] = [
      "text": text,
      "from": currentUid,
      "to": friendUid,
      "read": false,
      "timestamp": Timestamp(date: Date())
    ]
    currentRef.setData(data)
    friendRef.document(messageId).setData(data)
    if !text.isEmpty {
      
    }
  }
}
