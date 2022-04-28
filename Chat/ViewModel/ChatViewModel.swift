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
  let friendUid: String
  let friendName: String
  let friendUrl: String
  init(name: String, uid: String, url: String) {
    friendUid = uid
    friendUrl = url
    friendName = name
    fetchMessages()
  }
  
  func fetchMessages() {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
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
    let me = AuthViewModel.shared.person
    guard let currentUid = me.id else { return }
        
    let currentRef = COLLECTION_MESSAGES
      .document(currentUid)
      .collection(friendUid)
      .document()
    
    let friendRef = COLLECTION_MESSAGES
      .document(friendUid)
      .collection(currentUid)
    
    let recentCurrentRef = COLLECTION_MESSAGES
      .document(currentUid)
      .collection("recents")
      .document(friendUid)
    
    let recentFriendRef = COLLECTION_MESSAGES
      .document(friendUid)
      .collection("recents")
      .document(currentUid)
    
    let messageId = currentRef.documentID
    let data: [String: Any] = [
      "text": text,
      "read": false,
      "fromId": currentUid,
      "fromName": me.fullname,
      "fromUrl": me.profileImageUrl,
      "toId": friendUid,
      "toName": friendName,
      "toUrl": friendUrl,
      "timestamp": Timestamp(date: Date()),
    ]
    currentRef.setData(data)
    friendRef.document(messageId).setData(data)
    recentCurrentRef.setData(data)
    recentFriendRef.setData(data)
  }
}
