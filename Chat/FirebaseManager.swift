//
//  FirebaseManager.swift
//  Chat
//
//  Created by Vladimir Fibe on 18.02.2022.
//

import Foundation
import Firebase

class FirebaseManager {
  let auth: Auth
  let storage: Storage
  let firestore: Firestore
  
  static let shared = FirebaseManager()
  
  init() {
    auth = Auth.auth()
    storage = Storage.storage()
    firestore = Firestore.firestore()
  }
}
