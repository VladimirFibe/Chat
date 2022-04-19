//
//  AuthViewModel.swift
//  Chat
//
//  Created by MacService on 18.04.2022.
//

import Foundation
import Firebase
import UIKit

class AuthViewModel: ObservableObject {
  func login() {
    print(#function)
  }
  
  func register(withEmail email: String, password: String, fullname: String, username: String) {
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if let error = error {
        print("DEBUG: \(error.localizedDescription)")
        return
      }
      print("DEBUG: Successfully registered user with firebase")
      guard let user = result?.user else { return }
      let data: [String: Any] = [
        "email": email,
        "username": username,
        "fullname": fullname
      ]
      Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
        if let error = error {
          print("DEBUG: \(error.localizedDescription)")
          return
        }
        print("DEBUG: Successfully updated user info in firestore...")
      }
    }
  }
  
  func signout() {
    print(#function)
  }
  
  func uploadProfileImage(_ image: UIImage) {
    print(#function)
  }
  
  func resetPassword() {
    print(#function)
  }
}
