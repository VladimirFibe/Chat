//
//  SignInView.swift
//  Chat
//
//  Created by MacService on 05.06.2022.
//

import SwiftUI

struct SignInView: View {
  @State private var email = ""
  @State private var password = ""
  
  var body: some View {
    VStack(spacing: 24.0) {
      Text("Sign In")
        .customFont(.largeTitle)
      Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
        .customFont(.headline)
      
      VStack(alignment: .leading) {
        Text("Email")
          .customFont(.subheadline)
          .foregroundColor(.secondary)
        TextField("", text: $email)
          .customTextField()
      }
      
      VStack(alignment: .leading) {
        Text("Password")
          .customFont(.subheadline)
          .foregroundColor(.secondary)
        SecureField("", text: $email)
          .customTextField(image: Image("Icon Lock"))
      }
      let divider = Rectangle().frame(height: 1).opacity(0.1)
      HStack {
        divider
        Text("OR").customFont(.subheadline2)
          .foregroundColor(.black.opacity(0.3))
        divider
      }
      Text("Sign up with Email, Apple or Google")
        .customFont(.subheadline)
        .foregroundColor(.secondary)
      HStack {
        Image("Logo Email")
        Spacer()
        Image("Logo Apple")
        Spacer()
        Image("Logo Google")
      }
    }
    .padding(30)
    .background(.regularMaterial)
    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
    .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
    .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
      .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)))
    .padding()
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
  }
}