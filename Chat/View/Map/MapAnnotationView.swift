//
//  MapAnnotationView.swift
//  Chat
//
//  Created by MacService on 06.05.2022.
//

import SwiftUI

struct MapAnnotationView: View {
  let location: Person
  @State private var animation = 0.0
    var body: some View {
      ZStack {
        Circle()
          .fill(Color.accentColor)
          .frame(width: 54, height: 54, alignment: .center)
        
        Circle()
          .stroke(Color.accentColor, lineWidth: 2)
          .frame(width: 52, height: 52, alignment: .center)
          .scaleEffect(1 + CGFloat(animation))
          .opacity(1 - animation)
        AvatarView(url: location.profileImageUrl, width: 48)
      } //: ZSTACK
      .onAppear {
        withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
          animation = 1
        }
      }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(location: MOCK_PERSON)
    }
}
