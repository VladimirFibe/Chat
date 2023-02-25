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
