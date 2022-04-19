//
//  ImageUploader.swift
//  Chat
//
//  Created by MacService on 19.04.2022.
//

import Firebase
import UIKit

struct ImageUploader {
  static func uploadImage(_ image: UIImage, completion: @escaping (String) -> Void ) {
    guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
    let filename = NSUUID().uuidString
    let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
    ref.putData(imageData, metadata: nil) { _, error in
      if let error = error {
        print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
      }
      ref.downloadURL { url, _ in
        guard let imageUrl = url?.absoluteString else { return }
        completion(imageUrl)
      }
    }
  }
}
