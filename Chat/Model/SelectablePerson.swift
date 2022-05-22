//
//  SelectablePerson.swift
//  Chat
//
//  Created by MacService on 01.05.2022.
//

import SwiftUI

struct SelectablePerson: Identifiable {
//  static func == (lhs: SelectablePerson, rhs: SelectablePerson) -> Bool {
//    lhs.id == rhs.id
//  }
  
  var id: String {
    person.id ?? UUID().uuidString
  }
  var person: Person
  var isSelected = false
  var fullname: String {
    person.fullname
  }
  var username: String {
    person.username
  }
  var profileImageUrl: String {
    person.profileImageUrl
  }
  var selectedImage: String {
    isSelected ? "checkmark.circle.fill" : "circle"
  }
  var color: Color {
    isSelected ? .blue : .gray
  }
}
