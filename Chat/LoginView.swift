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
  
  var body: some View {
    NavigationView {
      ScrollView {
        content
      }
      .navigationTitle(isLoginMode ? "Log in" : "Create Account")
      .background(Color(.init(white: 0, alpha: 0.05)))
    }
    .navigationViewStyle(.stack)
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
      
      Text(loginStatus)
        .foregroundColor(.red)
        .multilineTextAlignment(.center)
    }
    .padding()
    
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
    }
  }
}


struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
