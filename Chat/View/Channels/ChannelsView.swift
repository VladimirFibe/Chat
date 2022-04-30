//
//  ChannelsView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct ChannelsView: View {
  @State private var showCreateGroupView = false
  var body: some View {
    ScrollView {
      VStack {
        ForEach(1..<5) { _ in
          ChannelCell()
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding()
    }
    .sheet(isPresented: $showCreateGroupView, onDismiss: {
      print("Dismiss")
    }) {
      CreateGroupView()
    }
    .overlay(alignment: .bottomTrailing) {
      BlueButton(show: $showCreateGroupView)
    }
  }
}

struct ChannelsView_Previews: PreviewProvider {
  static var previews: some View {
    ChannelsView()
  }
}
