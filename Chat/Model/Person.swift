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
  var email = ""
  var fullname = ""
  var username = ""
  var profileImageUrl = ""
}
