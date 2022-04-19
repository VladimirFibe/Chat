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
  @Published var didAuthenticateUser = false
  @Published var addPhoto = true
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
      self.addPhoto = false
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
        DispatchQueue.main.async {
          self.didAuthenticateUser = true
        }
      }
    }
  }
  
  func signout() {
    print(#function)
  }
  
  func uploadProfileImage(_ image: UIImage) {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    ImageUploader.uploadImage(image) { url in
      Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": url]) { _ in
        print("DEBUG: Successfully updated user profileImageUrl")
        DispatchQueue.main.async {
          self.addPhoto = true
        }
      }
    }
  }
  
  func resetPassword() {
    print(#function)
  }
}
