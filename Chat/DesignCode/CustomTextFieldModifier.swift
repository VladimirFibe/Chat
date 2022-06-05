//
//  CustomTextFieldModifier.swift
//  Chat
//
//  Created by MacService on 05.06.2022.
//

import SwiftUI

struct CustomTextFieldModifier: ViewModifier {
  let shape = RoundedRectangle(cornerRadius: 10, style: .continuous)
  let image: Image
  func body(content: Content) -> some View {
    content
      .padding([.vertical, .trailing], 15)
      .padding(.leading, 41)
      .background(.white)
      .mask(shape)
      .overlay(shape
        .stroke(.black.opacity(0.1))
      )
      .overlay(
        image
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 8)
      )
  }
}

extension View {
  func customTextField(image: Image = Image("Icon Email")) -> some View {
    modifier(CustomTextFieldModifier(image: image))
  }
}
