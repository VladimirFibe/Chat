//
//  MapViewModel.swift
//  Chat
//
//  Created by MacService on 06.05.2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class MapViewModel: ObservableObject {
  @Published var locations = [Person]()
  
  init() {
    fetchFriends()
  }
  
  func fetchFriends() {
    COLLECTION_PERSONS.addSnapshotListener { snapshot, _ in
      if let snapshot = snapshot {
        self.locations = snapshot.documents.compactMap { try? $0.data(as: Person.self)}
      }
    }
  }
}
