//
//  AuthOrMainView.swift
//  Chat
//
//  Created by MacService on 19.04.2022.
//

import SwiftUI

struct AuthOrMainView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  var body: some View {
    Group {
      if viewModel.addPhoto {
        MainTabView()
      } else {
        AuthView()
      }
    }
  }
}

struct AuthOrMainView_Previews: PreviewProvider {
  static var previews: some View {
    AuthOrMainView()
      .environmentObject(AuthViewModel())
  }
}