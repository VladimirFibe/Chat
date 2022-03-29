//
//  AuthView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct AuthView: View {
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        Text("Hello")
          .font(.largeTitle)
          .bold()
        
        Text("Welcome Back")
          .font(.largeTitle)
          .bold()
          .foregroundColor(.blue)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .padding()
      .navigationBarHidden(true)
    }
  }
}

struct AuthView_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
  }
}
