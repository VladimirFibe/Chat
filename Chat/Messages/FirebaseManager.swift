import Foundation
import Firebase
import FirebaseStorage

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
