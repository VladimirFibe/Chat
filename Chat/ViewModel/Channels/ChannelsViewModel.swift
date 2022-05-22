//
//  ChannelsViewModel.swift
//  Chat
//
//  Created by MacService on 20.05.2022.
//

import Foundation
import Firebase
class ChannelsViewModel: ObservableObject {
  @Published var channels = [Channel]()
  
  init() {
    fetchChannels()
  }
  
  func fetchChannels() {
    guard let uid = Auth.auth().currentUser?.uid else { return }

    COLLECTION_CHANNELS.whereField("uids", arrayContains: uid).getDocuments { snapshot, _ in
      guard let documents = snapshot?.documents else { return }
      self.channels = documents.compactMap({ try? $0.data(as: Channel.self)})
    }
    
//    COLLECTION_CHANNELS
//      .whereField("uids", arrayContains: uid)
//      .addSnapshotListener { snapshot, _ in
//        guard let documents = snapshot?.documents else { return }
//        self.channels = documents.compactMap({ try? $0.data(as: Channel.self)})
//      }
  }
}
