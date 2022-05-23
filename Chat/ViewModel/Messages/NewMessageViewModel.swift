//
//  NewMessageViewModel.swift
//  Chat
//
//  Created by MacService on 20.04.2022.
//

import SwiftUI
import Firebase

class NewMessageViewModel: ObservableObject {
  @Published var persons = [Person]()
  
  init() {
    fetchPesons()
  }
  
  func fetchPesons() {
    // TODO: - Можно ли отфильтровать текущего пользователя на стороне firebase?
    COLLECTION_PERSONS.getDocuments { snapshot, error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      guard let uid = Auth.auth().currentUser?.uid else { return }
      guard let documents = snapshot?.documents else { return }
      self.persons = documents
        .compactMap({ try? $0.data(as: Person.self)})
        .filter({ $0.id != uid })
    }
  }
}
