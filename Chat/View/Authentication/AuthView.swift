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
    VStack(spacing: 20.0) {
      TextField("Email", text: $email)
      SecureField("Password", text: $password)
    }
    .padding(.horizontal, 32)
  }
  
  var signinButton: some View {
    Button {
      print(email, password)
    } label: {
      Text("Sign In")
    }
    .buttonStyle(.borderedProminent)
    .shadow(color: .gray, radius: 10, x: 0, y: 0)
    .frame(maxWidth: .infinity)
  }
  
  var forgotPasswordView: some View {
    HStack {
      Spacer()
      NavigationLink(destination: Text("Pass")) {
        Text("Forgot Password?")
      }
    }
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
