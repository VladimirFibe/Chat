//
//  AvatarView.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct AvatarView: View {
  var url: String
  var width = 64.0
  var body: some View {
    AsyncImage(url:  URL(string: url)) { image in
      image
        .resizable()
        .scaledToFill()
        .frame(width: width, height: width)
        .clipShape(Circle())
    } placeholder: {
      ProgressView()
    }
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView(url: "")
  }
}
