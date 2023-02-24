import SwiftUI

struct AuthOrMainView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  var body: some View {
    Group {
      if viewModel.canlogin {
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
      .environmentObject(AuthViewModel.shared)
  }
}
