//
//  AvatarView.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct AvatarView: View {
  let image: Image
  var width = 64.0
  var body: some View {
    image
      .resizable()
      .scaledToFill()
      .frame(width: width, height: width)
      .clipShape(Circle())
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView(image: Image("profile"))
  }
}
