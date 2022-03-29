//
//  CustomTextField.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct CustomTextField: View {
  let image: String
  let placeholder: String
  var isSecureField = false
  @Binding var text: String
  var body: some View {
    VStack(spacing: 16.0) {
      HStack {
        Image(systemName: image)
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
          .foregroundColor(.darkGray)
        if isSecureField {
          SecureField(placeholder, text: $text)
        } else {
          TextField(placeholder, text: $text)
        }
      }
      Divider()
    }
  }
}


struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
      CustomTextField(image: "envelope", placeholder: "Email", text: .constant(""))
        .padding()
    }
}
