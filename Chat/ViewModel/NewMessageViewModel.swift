//
//  NewMessageViewModel.swift
//  Chat
//
//  Created by MacService on 20.04.2022.
//

import SwiftUI

class NewMessageViewModel: ObservableObject {
  @Published var persons = [Person]()
  
  init() {
    fetchPesons()
  }
  func fetchPesons() {
    COLLECTION_PERSONS.getDocuments { snapshot, error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      guard let documents = snapshot?.documents else { return }
      self.persons = documents.compactMap({ try? $0.data(as: Person.self)})
    }
  }
}
