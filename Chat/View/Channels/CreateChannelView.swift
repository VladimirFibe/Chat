//
//  CreateChannelView.swift
//  Chat
//
//  Created by MacService on 20.05.2022.
//

import SwiftUI

struct CreateChannelView: View {
  @ObservedObject var viewModel: CreateChannelViewModel
  @State private var imagePickerPresented = false
  @State private var selectedImage: UIImage?
  @State private var profileImage = Image("plus_photo")
  @State private var  channelName = ""
  @Binding var show: Bool
  var channelDivider: some View {
    Rectangle()
      .frame(height: 0.5)
      .foregroundColor(Color(.separator))
  }
  var createChannelButton: some View {
    Button {
      viewModel.createChannel(name: channelName, image: selectedImage)
    } label: {
      Text("Create").bold()
    }
    .disabled(channelName.isEmpty || viewModel.loading)
  }
  var addPhoto: some View {
    Button {
      imagePickerPresented.toggle()
    } label: {
      profileImage
        .resizable()
        .renderingMode(selectedImage == nil ? .template : .original)
        .scaledToFill()
        .frame(width: 64, height: 64)
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
  var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 32.0) {
        addPhoto
        
        VStack(alignment: .leading, spacing: 12.0) {
          channelDivider
          TextField("Enter a name for your channel", text: $channelName)
            .font(.system(size: 15))
          channelDivider
          Text("Hello, World!")
        }
        Spacer()
      }
      Spacer()
    }
    .onReceive(viewModel.$didCreateChannel, perform: { completed in
      if completed {
        show.toggle()
      }
    })
    .padding()
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        createChannelButton
      }
    }
  }
}

//struct CreateChannelView_Previews: PreviewProvider {
//  static var previews: some View {
//    CreateChannelView(viewModel: CreateChannelViewModel([]))
//  }
//}
