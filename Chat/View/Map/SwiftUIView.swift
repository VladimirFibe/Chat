//
//  SwiftUIView.swift
//  Chat
//
//  Created by MacService on 22.05.2022.
//

import SwiftUI

struct SwiftUIView: View {
  @State var arrP = ["p1", "p2", "p3"]
  var body: some View {
    VStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 5) {
          ForEach(arrP, id: \.self) { item in
            Text(item)
              .foregroundColor(Color.black.opacity(0.7))
              .font(.system(size: 22, weight: .regular, design: .default))
            if (arrP.count - 1) != (arrP.lastIndex(of: item) ?? 0) {
//              Menu("Знак") {
//                Button(action: {}) {Text("<")}
//                Button(action: {}) {Text("=")}
//                Button(action: {}) {Text(">")}
//              }
              Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Picker")) {
                Text("<").tag(1)
                Text("=").tag(2)
                Text(">").tag(3)
              }
              
            }
          }
        }
        .frame(height: 50)
        .padding()
      }
      Spacer()
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
