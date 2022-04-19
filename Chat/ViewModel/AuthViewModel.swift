//
//  AuthViewModel.swift
//  Chat
//
//  Created by MacService on 18.04.2022.
//

import Foundation
import Firebase
import UIKit
import Combine

class AuthViewModel: ObservableObject {
  @Published var user: User?
  @Published var didAuthenticateUser = false
  @Published var addPhoto = true
  @Published var isAnonymous = true
  var canlogin: Bool {
    !isAnonymous && addPhoto
  }
  static let shared = AuthViewModel()
  private var cancellables = Set<AnyCancellable>()
  private var handle: AuthStateDidChangeListenerHandle?
  private init() {
    print(#function)
    registerStateListener()
    $user
      .compactMap { $0?.isAnonymous }
      .assign(to: \.isAnonymous, on: self)
      .store(in: &cancellables)
  }
  
  func signIn() {
    print(#function)
    if Auth.auth().currentUser == nil {
      Auth.auth().signInAnonymously()
    }
  }
  func registerStateListener() {
    if let handle = handle {
      Auth.auth().removeStateDidChangeListener(handle)
    }
    self.handle = Auth.auth().addStateDidChangeListener({ auth, user in
      print("DEBUG: Sign in state has changed.")
      self.user = user
      if let user = user {
        print("DEBUG", user.uid)
      } else {
        print("DEBUG: User signed out")
        self.signIn()
      }
    })
  }
  func login(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if let error = error {
        print("DEBUG: \(error.localizedDescription)")
      }
    }
  }
  
  func register(withEmail email: String, password: String, fullname: String, username: String) {
    addPhoto = false
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
    try? Auth.auth().signOut()
//    do {
//      try Auth.auth().signOut()
//    } catch {
//      print("Error when trying to sign out: \(error.localizedDescription)")
//    }
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
