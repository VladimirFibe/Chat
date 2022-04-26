//
//  Person.swift
//  Chat
//
//  Created by MacService on 19.04.2022.
//

import Foundation
import FirebaseFirestoreSwift
struct Person: Codable, Identifiable {
  @DocumentID var id: String?
  var email = "cat@me.com"
  var fullname = "Cat"
  var username = "матроскин"
  var profileImageUrl = "https://i.pinimg.com/736x/84/d4/b6/84d4b6b6302d87c8b21706c6347be558.jpg"
}
