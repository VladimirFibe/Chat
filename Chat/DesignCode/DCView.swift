//
//  DCView.swift
//  Chat
//
//  Created by MacService on 30.05.2022.
//

import SwiftUI

struct DCView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Spacer()
      Image("Logo 2")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 26, height: 26)
        .cornerRadius(10)
        .padding(9)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
      Text("SwiftUI for iOS 15")
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
      Text("20 section - 3 hours".uppercased())
        .font(.footnote)
        .fontWeight(.semibold)
        .foregroundStyle(.secondary)
      Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
        .font(.footnote)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.secondary)
    }
    .padding(.horizontal, 20.0)
    .padding(.vertical, 40)
    .frame(height: 350.0)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
    .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
    .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
      .stroke(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom))
      .blendMode(.overlay))
    .padding(.horizontal, 20)
    .background(Image("Blob").offset(x: 250, y: -100))
    .overlay(
      Image("Illustration 5")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 230)
        .offset(x: 32, y: -80))
  }
}

struct DCView_Previews: PreviewProvider {
  static var previews: some View {
    DCView()
  }
}
