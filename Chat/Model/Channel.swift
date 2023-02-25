import FirebaseFirestoreSwift

struct Channel: Identifiable, Decodable {
  @DocumentID var id: String?
  let imageUrl: String?
  let lastMessage: String
  let name: String
  let uids: [String]
}
