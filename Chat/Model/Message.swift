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
  var text = ""
  var fromId = ""
  var fromName = ""
  var fromUrl = ""
  var toId = ""
  var toName = ""
  var toUrl = ""
  var read = false
  var timestamp: Timestamp? = nil
  
  var me: Bool {
    fromId == Auth.auth().currentUser?.uid
  }
  
  var name: String {
    me ? toName : fromName
  }
  
  var uid: String {
    me ? toId : fromId
  }
  
  var url: String {
    me ? toUrl : fromUrl
  }
}
