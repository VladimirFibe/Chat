//
//  AuthView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct AuthView: View {
  @State private var email = ""
  @State private var password = ""
  var body: some View {
    NavigationView {
      VStack(alignment: .leading, spacing: 30.0) {
        title
        
        fields
        
        forgotPasswordView
        
        signinButton
        
        Spacer()
        
        registerView
      }
      .frame(maxWidth: .infinity, alignment: .topLeading)
      .padding()
      .navigationBarHidden(true)
    }
  }
  
  var title: some View {
    VStack(alignment: .leading) {
      Text("Hello")
        .font(.largeTitle)
        .bold()
      
      Text("Welcome Back")
        .font(.largeTitle)
        .bold()
        .foregroundColor(.blue)
    }
  }
  
  var fields: some View {
    VStack(spacing: 40.0) {
      CustomTextField(image: "envelope", placeholder: "Email", text: $email)
      CustomTextField(image: "lock", placeholder: "Password", isSecureField: true, text: $password)
    }
    .padding(.horizontal, 32)
  }
  
  var signinButton: some View {
    Button {
      print(email, password)
      AuthViewModel.shared.login(withEmail: email, password: password)
    } label: {
      Text("Sign In")
        .frame(maxWidth: .infinity)
    }
    .buttonStyle(.borderedProminent)
    .padding(.horizontal, 40)
    .shadow(color: .gray, radius: 10, x: 0, y: 0)
  }
  
  var forgotPasswordView: some View {
    HStack {
      Spacer()
      NavigationLink(destination: Text("Pass")) {
        Text("Forgot Password?")
      }
    }
    .padding(.trailing)
  }
  
  var registerView: some View {
    NavigationLink(destination: RegistrationView()) {
      Text("Don't have an account? ") + Text("Sign Up").bold()
    }
    .frame(maxWidth: .infinity)
  }
}

struct AuthView_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
  }
}


