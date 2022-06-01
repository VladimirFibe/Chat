//
//  Styles.swift
//  Chat
//
//  Created by MacService on 30.05.2022.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
  var cornerRadius: CGFloat = 30
  var style: RoundedCornerStyle = .continuous
  @Environment(\.colorScheme) var colorScheme
  var isDark: Bool {
    colorScheme == .dark
  }
  func body(content: Content) -> some View {
    content
      .overlay(
        RoundedRectangle(cornerRadius: cornerRadius, style: style)
          .stroke(.linearGradient(
            colors: [
              .white.opacity(isDark ? 0.6 : 0.3),
              .black.opacity(isDark ? 0.3 : 0.1)],
            startPoint: .top,
            endPoint: .bottom))
          .blendMode(.overlay)
      )
  }
}

extension View {
  
  func strokeStyle(cornerRadius: CGFloat = 30, style: RoundedCornerStyle = .continuous) -> some View {
    modifier(StrokeStyle(cornerRadius: cornerRadius, style: style))
  }
}
