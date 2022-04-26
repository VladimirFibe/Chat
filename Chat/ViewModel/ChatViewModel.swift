//
//  ChatViewModel.swift
//  Chat
//
//  Created by Vladimir Fibe on 18.04.2022.
//

import Firebase
import FirebaseFirestoreSwift

class ChatViewModel: ObservableObject {
  @Published var messages = [Message]()
  let friend: Person
  init(friend: Person) {
    self.friend = friend
    fetchMessages()
  }
  
  func fetchMessages() {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
    guard let friendUid = friend.id else { return }
    let query = COLLECTION_MESSAGES
      .document(currentUid)
      .collection(friendUid)
      .order(by: "timestamp", descending: false)
    
    query.addSnapshotListener { snapshot, _ in
      guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
      let messages = changes.compactMap { try? $0.document.data(as: Message.self)}
      self.messages.append(contentsOf: messages)
    }
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
  }
}
