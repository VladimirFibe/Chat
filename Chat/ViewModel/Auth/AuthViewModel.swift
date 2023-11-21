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
import FirebaseStorage

class AuthViewModel: ObservableObject {
  
  @Published var user: User?
  @Published var didAuthenticateUser = false
  @Published var addPhoto = true
  @Published var isAnonymous = true
  @Published var person = Person()
  @Published var showError = false
  var errorText = ""
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
      } else if !self.isAnonymous {
        self.fetchPerson()
      }
    }
  }
  func login(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if let error = error {
        self.showError = true
        self.errorText = error.localizedDescription
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
        "fullname": fullname,
        "status": UserStatus.notConfigured.rawValue,
        "latitude": 0.0,
        "longitude": 0.0
      ]
      COLLECTION_PERSONS.document(uid).setData(data) { error in
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
      COLLECTION_PERSONS.document(uid).updateData(["profileImageUrl": url]) { _ in
        DispatchQueue.main.async {
          self.addPhoto = true
          self.person.profileImageUrl = url
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
    guard let uid = user?.uid else { return }
    COLLECTION_PERSONS.document(uid).getDocument { snapshot, error in
      guard let person = try? snapshot?.data(as: Person.self) else { return }
      self.person = person
    }
  }
  
  func updateProfileImage(_ image: UIImage) {
    guard let uid = person.id else { return }
    let storagePath = Storage.storage().reference(forURL: person.profileImageUrl)
    
    storagePath.delete { error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      ImageUploader.uploadImage(image) { imageUrl in
        COLLECTION_PERSONS.document(uid).updateData(["profileImageUrl": imageUrl]) { _ in
          self.person.profileImageUrl = imageUrl
        }
      }
    }
  }
  
  func updateName(_ name: String) {
    guard let uid = person.id else { return }
    COLLECTION_PERSONS.document(uid).updateData(["fullname": name]) { _ in
      self.person.fullname = name
    }
  }
  
  func updateStatus(_ status: UserStatus) {
    guard let uid = person.id else { return }
    let data = ["status": status.rawValue]
    COLLECTION_PERSONS.document(uid).updateData(data) { error in
      if let error = error {
        print(error.localizedDescription)
      }
      self.person.status = status
    }
  }
}
