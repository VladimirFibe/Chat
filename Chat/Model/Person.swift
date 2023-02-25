import Foundation
import FirebaseFirestoreSwift
import MapKit

struct Person: Codable, Identifiable {
  @DocumentID var id: String?
  var email = "cat@me.com"
  var fullname = "Cat"
  var username = "матроскин"
  var status = UserStatus.notConfigured
  var profileImageUrl = "https://i.pinimg.com/736x/84/d4/b6/84d4b6b6302d87c8b21706c6347be558.jpg"
  var latitude = 43.235143
  var longitude = 76.892030
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
