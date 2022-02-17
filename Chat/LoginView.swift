//
//  LoginView.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import SwiftUI

struct LoginView: View {
  @State var isLoginMode = false
  @State var email = ""
  @State var password = ""
  var body: some View {
    NavigationView {
      ScrollView {
        content
      }
      .navigationTitle(isLoginMode ? "Log in" : "Create Account")
      .background(Color(.init(white: 0, alpha: 0.05)))
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
          
        } label: {
          Image(systemName: "person.fill")
            .font(.system(size: 64))
        }
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
    }
    .padding()
    
  }
  private func handleAction() {
    if isLoginMode {
      print("Login")
    } else {
      print("create")
    }
  }
}


struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
