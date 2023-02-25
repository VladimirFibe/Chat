import Firebase
import FirebaseFirestoreSwift

struct Conversation: Identifiable, Decodable {
  @DocumentID var id: String?
  var uid: String
  var profileImageUrl: String
  var text: String
  var read = false
  var timestamp: Timestamp? = nil
}
