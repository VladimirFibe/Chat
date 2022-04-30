//
//  BlueButton.swift
//  Chat
//
//  Created by MacService on 29.04.2022.
//

import SwiftUI

struct BlueButton: View {
  @Binding var show: Bool
  var systemName = "square.and.pencil"
  var body: some View {
    Button {
      show.toggle()
    } label: {
      Image(systemName: systemName)
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .padding()
        .background(Color.systemBlue, in: Circle())
        .tint(.white)
        .padding()
    }
  }
}

struct BlueButton_Previews: PreviewProvider {
  static var previews: some View {
    BlueButton(show: .constant(true))
  }
}
