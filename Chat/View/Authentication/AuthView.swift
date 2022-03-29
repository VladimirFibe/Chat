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
      VStack(alignment: .leading) {
        title
        
        fields
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
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
    .padding([.top, .horizontal], 32)
  }
}

struct AuthView_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
  }
}
