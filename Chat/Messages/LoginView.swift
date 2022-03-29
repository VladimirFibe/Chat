//
//  LoginView.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import SwiftUI
import Firebase

struct LoginView: View {
  @State var isLoginMode = false
  @State var email = ""
  @State var password = ""
  @State var loginStatus = ""
  @State var shouldShowImagePicker = false
  @State var image: UIImage?
  let avatarWidth = 128.0
  var body: some View {
    NavigationView {
      ScrollView {
        content
      }
      .navigationTitle(isLoginMode ? "Log in" : "Create Account")
      .background(Color(.init(white: 0, alpha: 0.05)))
    }
    .navigationViewStyle(.stack)
    .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
      ImagePicker(image: $image)
    }
  }
  var content: some View {
    VStack(spacing: 16) {
      Picker(selection: $isLoginMode, label: Text("Picker here")) {
        Text("Login").tag(true)
        Text("Create Account").tag(false)
      }
      .pickerStyle(.segmented)
      if !isLoginMode {
        Button {
          shouldShowImagePicker.toggle()
        } label: { avatar }
      }
      Group {
        TextField("Email", text: $email)
          .keyboardType(.emailAddress)
          .autocapitalization(.none)
        SecureField("Password", text: $password)
      }
      .padding(12)
      .background(Color.white)
      
      Button(action: handleAction) {
        Text(isLoginMode ? "Log In" : "Create Account")
          .font(.system(size: 14, weight: .semibold))
          .padding(.vertical, 10)
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(.borderedProminent)
      
      Text(loginStatus)
        .foregroundColor(.red)
        .multilineTextAlignment(.center)
    }
    .padding()
    
  }
  
  var avatar: some View {
    VStack {
      if let image = image {
        Image(uiImage: image)
          .resizable()
          .scaledToFill()
          .frame(width: avatarWidth, height: avatarWidth)
          .clipShape(Circle())
      } else {
        Image(systemName: "person.fill")
          .font(.system(size: 0.75 * avatarWidth))
          .frame(width: avatarWidth, height: avatarWidth)
          .foregroundColor(Color(.label))
      }
        
    }
    .overlay(
      Circle().stroke(Color.black, lineWidth: 3))
  }
  
  private func handleAction() {
    if isLoginMode {
      loginUser()
    } else {
      createNewAccount()
    }
  }
  
  private func loginUser() {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if let error = error {
        loginStatus = "Failed to login user: \(error.localizedDescription)"
        return
      }
      
      loginStatus = "Successfully logged as user: \(result?.user.uid ?? "...")"
    }
  }
  
  private func createNewAccount() {
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if let error = error {
        loginStatus = "Failed to create user: \(error.localizedDescription)"
        return
      }
      loginStatus = "Successfully created user: \(result?.user.uid ?? "...")"
      
      persistImageToStorage()
    }
  }
  
  private func persistImageToStorage() {
    guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
    let ref = FirebaseManager.shared.storage.reference(withPath: uid)
    guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
    ref.putData(imageData, metadata: nil) { metadata, error in
      if let error = error {
        loginStatus = "Failed to push image to Storage: \(error.localizedDescription)"
        return
      }
      
      ref.downloadURL { url, error in
        if let error = error {
          loginStatus = "Failed to retrieve download URL: \(error.localizedDescription)"
          return
        }
        if let url = url {
          loginStatus = "Successfully stored image with url: \(url.absoluteString)"
          print(loginStatus)
          self.storeUserInfromation(imageProfileUrl: url)
        }
      }
    }
  }
  private func storeUserInfromation(imageProfileUrl: URL) {
    guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
    let userData = [
      "email": email,
      "uid": uid,
      "prifileImageUrl": imageProfileUrl.absoluteString
    ]
    FirebaseManager.shared.firestore.collection("users").document(uid).setData(userData) { error in
      if let error = error {
        loginStatus = "Failed: \(error.localizedDescription)"
        return
      }
      loginStatus = "Success"
      print(loginStatus)
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
