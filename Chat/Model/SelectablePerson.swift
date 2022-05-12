//
//  SelectablePerson.swift
//  Chat
//
//  Created by MacService on 01.05.2022.
//

import Foundation

struct SelectablePerson: Identifiable {
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
}
