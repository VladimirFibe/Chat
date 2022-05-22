//
//  ConversationsViewModel.swift
//  Chat
//
//  Created by MacService on 28.04.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ConversationsViewModel: ObservableObject {
  @Published var conversations = [Conversation]()
  init() {
    fetchMessages()
  }
  func fetchMessages() {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    let query = COLLECTION_MESSAGES
      .document(uid)
      .collection("recents")
      .order(by: "timestamp", descending: true)

    query.addSnapshotListener { snapshot, _ in
      if let snapshot = snapshot {
        self.conversations = snapshot.documents.compactMap {
          return try? $0.data(as: Conversation.self)}
      }
    }
  }
}
