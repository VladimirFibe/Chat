//
//  RegistrationView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct RegistrationView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var viewModel = AuthViewModel()
  @State private var email = ""
  @State private var password = ""
  @State private var username = ""
  @State private var fullname = ""
  var body: some View {
    VStack(alignment: .leading, spacing: 30.0) {
      title
      
      fields
      
      signupButton
      
      Spacer()
      
      registerView
    }
    .frame(maxWidth: .infinity, alignment: .topLeading)
    .padding()
    .navigationBarHidden(true)
  }
  
  var title: some View {
    VStack(alignment: .leading) {
      Text("Get started.")
        .font(.largeTitle)
        .bold()
      
      Text("Create your account")
        .font(.largeTitle)
        .bold()
        .foregroundColor(.blue)
    }
  }
  
  var fields: some View {
    VStack(spacing: 40.0) {
      CustomTextField(image: "envelope", placeholder: "Email", text: $email)
      CustomTextField(image: "person", placeholder: "Username", text: $username)
      CustomTextField(image: "person", placeholder: "Fullname", text: $fullname)
      CustomTextField(image: "lock", placeholder: "Password", isSecureField: true, text: $password)
    }
    .padding(.horizontal, 32)
  }
  
  var signupButton: some View {
    Button {
      print(email, password)
      viewModel.register()
    } label: {
      Text("Sign Up")
        .frame(maxWidth: .infinity)
    }
    .buttonStyle(.borderedProminent)
    .padding(.horizontal, 40)
    .shadow(color: .gray, radius: 10, x: 0, y: 0)
  }
  
  var registerView: some View {
    Button {
      viewModel.register()
      dismiss()
    } label: {
      Text("Already have an account? ") + Text("Sign In").bold()
    }
    .frame(maxWidth: .infinity)
  }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
