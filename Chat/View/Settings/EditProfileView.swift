//
//  EditProfileView.swift
//  Chat
//
//  Created by Владимир Файб on 30.03.2022.
//

import SwiftUI

struct EditProfileView: View {
  @State private var fullname = "Eddie Brock"
  @State private var showImagePicker = false
  @State private var image: UIImage?
  @State private var avatar = Image("profile")
  var body: some View {
    VStack(spacing: 20.0) {
      header
      status
      Spacer()
    }
    .padding(.vertical)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color(.systemGroupedBackground))
    .navigationTitle("Edit Profile")
    .navigationBarTitleDisplayMode(.inline)
    .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
      ImagePicker(image: $image).edgesIgnoringSafeArea(.bottom)
    }
  }
  var header: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 20.0) {
        VStack {
          AvatarView(image: avatar)
            
          Button {
            showImagePicker.toggle()
          } label: {
            Text("Edit")
          }
        }
        Text("Enter you name or change your profile photo")
          .font(.system(size: 16))
          .foregroundColor(.gray)
        Spacer()
      }
      Divider().padding(.horizontal)
      TextField("Enter your name", text: $fullname)
    }
    .padding()
    .background(Color.white)
  }
  var status: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text("Status")
        .padding()
        .foregroundColor(.gray)
      NavigationLink(destination: StatusSelectorView()) {
        HStack {
          Text("At the movies")
          Spacer()
          Image(systemName: "chevron.right")
            .foregroundColor(.gray)
        }
        .padding()
      .background(Color.white)
      }
    }
  }
  func loadImage() {
    if let image = image {
      avatar = Image(uiImage: image)
    }
  }
}

struct EditProfileView_Previews: PreviewProvider {
  static var previews: some View {
    EditProfileView()
  }
}
