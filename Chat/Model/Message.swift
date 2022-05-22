//
//  Message.swift
//  Chat
//
//  Created by Vladimir Fibe on 18.04.2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
  @DocumentID var id: String?
  var uid: String
  var name: String?
  var profileImageUrl: String?
  var text: String
  var read = false
  var timestamp: Timestamp? = nil
}
