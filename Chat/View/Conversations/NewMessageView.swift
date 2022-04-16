//
//  NewMessageView.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct NewMessageView: View {
  @Environment(\.dismiss) var dismiss
    var body: some View {
      ScrollView {
        VStack(alignment: .leading) {
          ForEach(0 ..< 25) { item in
            Button(action: {
              dismiss()
            }) {
              UserCell()
                .tint(.black)
            }
          }
        }
        .padding()
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
