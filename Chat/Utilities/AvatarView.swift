//
//  AvatarView.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct AvatarView: View {
  let image: Image
  var body: some View {
    image
      .resizable()
      .scaledToFill()
      .frame(width: 64, height: 64)
      .clipShape(Circle())
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView(image: Image("profile"))
  }
}
