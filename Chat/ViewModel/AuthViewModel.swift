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
  let personCollection = Firestore.firestore().collection("persons")
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
    registerStateListener()
    $user
      .compactMap { $0?.isAnonymous }
      .assign(to: \.isAnonymous, on: self)
      .store(in: &cancellables)
  }
  
  func signIn() {
    if Auth.auth().currentUser == nil {
      Auth.auth().signInAnonymously()
    }
  }
  
  func registerStateListener() {
    if let handle = handle {
      Auth.auth().removeStateDidChangeListener(handle)
    }
    self.handle = Auth.auth().addStateDidChangeListener{ _, user in
      self.user = user
      if user == nil {
        self.signIn()
      } else {
        self.fetchPerson()
      }
    }
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
      guard let uid = result?.user.uid else { return }
      let data: [String: Any] = [
        "email": email,
        "username": username,
        "fullname": fullname
      ]
      self.personCollection.document(uid).setData(data) { error in
        if let error = error {
          print("DEBUG: \(error.localizedDescription)")
          return
        }
        DispatchQueue.main.async {
          self.didAuthenticateUser = true
        }
      }
    }
  }
  
  func signout() {
    try? Auth.auth().signOut()
  }
  
  func uploadProfileImage(_ image: UIImage) {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    ImageUploader.uploadImage(image) { url in
      self.personCollection.document(uid).updateData(["profileImageUrl": url]) { _ in
        DispatchQueue.main.async {
          self.addPhoto = true
        }
      }
    }
  }
  
  func resetPassword(withEmail email: String) {
    Auth.auth().sendPasswordReset(withEmail: email) { error in
      if let error = error {
        print("DEBUG: \(error.localizedDescription)")
        return
      }
    }
  }
  
  func fetchPerson() {
    print(#function)
    guard let uid = user?.uid else { return }
    personCollection.document(uid).getDocument { snapshot, error in
      guard let data = snapshot?.data() else { return }
      print(data)
    }
  }
}
