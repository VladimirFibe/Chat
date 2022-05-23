//
//  EditProfileViewModel.swift
//  Chat
//
//  Created by MacService on 23.05.2022.
//

import UIKit

class EditProfileViewModel: ObservableObject {
  @Published var person: Person
  
  init(_ person: Person) {
    self.person = person
  }
  
  func updateProfileImage(_ image: UIImage) {
    
  }
  
  func updateName(_ name: String) {
    
  }
  
  func updateStatus(_ status: UserStatus) {
    
  }
}
