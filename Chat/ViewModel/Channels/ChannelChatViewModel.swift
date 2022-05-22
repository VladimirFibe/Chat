//
//  ChannelChatViewModel.swift
//  Chat
//
//  Created by MacService on 21.05.2022.
//

import Firebase

class ChannelChatViewModel: ObservableObject {
  let channel: Channel
  @Published var messages = [Message]()
  init(_ channel: Channel) {
    self.channel = channel
    fetchChannelMessages()
  }
  func fetchChannelMessages() {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
    guard let channelId = channel.id else { return }
    let query = COLLECTION_CHANNELS
      .document(channelId)
      .collection("messages")
      .order(by: "timestamp", descending: false)
    
    query.addSnapshotListener { snapshot, _ in
      guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
      var messages = changes.compactMap { try? $0.document.data(as: Message.self)}
      for (i, message) in messages.enumerated() where message.uid == currentUid {
          messages[i].profileImageUrl = nil
      }
      self.messages.append(contentsOf: messages)
    }
  }
  
  func sendChannelMessage(_ text: String) {
    let me = AuthViewModel.shared.person
    guard let currentUid = me.id else { return }
    guard let channelId = channel.id else { return }
    
    let data: [String: Any] = [
      "text": text,
      "read": false,
      "profileImageUrl": me.profileImageUrl,
      "uid": currentUid,
      "name": me.fullname,
      "timestamp": Timestamp(date: Date())
    ]
    let lastMessage = "\(me.username): \(text)"
    COLLECTION_CHANNELS
      .document(channelId)
      .collection("messages")
      .document()
      .setData(data)
    
    COLLECTION_CHANNELS
      .document(channelId)
      .updateData(["lastMessage": lastMessage])
  }
}
