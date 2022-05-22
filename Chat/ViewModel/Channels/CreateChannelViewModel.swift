//
//  CreateChannelViewModel.swift
//  Chat
//
//  Created by MacService on 20.05.2022.
//

import Foundation
import UIKit

class CreateChannelViewModel: ObservableObject {
  @Published var didCreateChannel = false
  @Published var loading = false
  let persons: [SelectablePerson]
  init(_ persons: [SelectablePerson]) {
    self.persons = persons
  }
  
  func createChannel(name: String, image: UIImage?) {
    let me = AuthViewModel.shared.person
    guard let meId = me.id else { return }
    var uids = persons.map { $0.id }
    uids.append(meId)
    loading = true
    if let image = image {
      ImageUploader.uploadImage(image) { imageUrl in
        let data: [String: Any] = [
          "name": name,
          "uids": uids,
          "lastMessage": "\(me.fullname) created a channel",
          "imageUrl": imageUrl
        ]
        COLLECTION_CHANNELS.document().setData(data) { error in
          if let error = error {
            print(error.localizedDescription)
          }
          self.didCreateChannel = true
          self.loading = false
        }
      }
    }
  }
}
