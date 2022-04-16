//
//  NewMessageView.swift
//  Chat
//
//  Created by Vladimir Fibe on 16.04.2022.
//

import SwiftUI

struct NewMessageView: View {
    var body: some View {
      ScrollView {
        VStack(alignment: .leading) {
          ForEach(0 ..< 25) { item in
            UserCell()
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
