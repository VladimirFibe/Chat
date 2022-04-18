//
//  ChatInputView.swift
//  Chat
//
//  Created by Vladimir Fibe on 18.04.2022.
//

import SwiftUI

struct ChatInputView: View {
  @Binding var text: String
  var action: () -> Void
    var body: some View {
      VStack {
        Rectangle()
          .frame(height: 0.75)
          .foregroundColor(Color(.separator))
        
        HStack {
          TextField("Message...", text: $text)
          Button(action: action) {
            Text("Send")
              .bold()
          }
          .disabled(text.isEmpty)
        }
        .padding()
      }
    }
}

struct ChatInputView_Previews: PreviewProvider {
    static var previews: some View {
      ChatInputView(text: .constant(""), action: {})
    }
}
