//
//  ProfilePhotoSelectorView.swift
//  Chat
//
//  Created by MacService on 19.04.2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
  @State private var imagePickerPresented = false
  @State private var selectedImage: UIImage?
  @State private var profileImage = Image("plus_photo")
  @ObservedObject var viewModel = AuthViewModel()
  var body: some View {
    VStack {
      button
      
      Text(selectedImage == nil ? "Select a profile photo" : "Great! Tap below to continue")
        .font(.system(size: 20, weight: .semibold))
      
      if let selectedImage = selectedImage {
        Button {
          viewModel.uploadProfileImage(selectedImage)
        } label: {
          Text("Continue")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 340, height: 50)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding()
        }
        .padding(.top, 24)
      }
      Spacer()
    }
    .navigationBarBackButtonHidden(true)
  }
  var button: some View {
    Button {
      imagePickerPresented.toggle()
    } label: {
      profileImage
        .resizable()
        .renderingMode(selectedImage == nil ? .template : .original)
        .scaledToFill()
        .frame(width: 180, height: 180)
        .clipShape(Circle())
      
    }
    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
      ImagePicker(image: $selectedImage)
    }
  }
  func loadImage() {
    guard let selectedImage = selectedImage else {
      return
    }
    profileImage = Image(uiImage: selectedImage)
  }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
  static var previews: some View {
    ProfilePhotoSelectorView()
//      .environmentObject(AuthViewModel())
  }
}
