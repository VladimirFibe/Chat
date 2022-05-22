//
//  ChannelsView.swift
//  Chat
//
//  Created by Владимир Файб on 29.03.2022.
//

import SwiftUI

struct ChannelsView: View {
  @State private var showCreateGroupView = false
  @ObservedObject var viewModel = ChannelsViewModel()
  var body: some View {
    ScrollView {
      VStack {
        ForEach(viewModel.channels) { channel in
          NavigationLink(destination: ChannelChatView(viewModel: ChannelChatViewModel(channel))) {
            ChannelCell(channel: channel)
          }
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding()
    }
    .sheet(isPresented: $showCreateGroupView, onDismiss: {
    }) {
      CreateGroupView(show: $showCreateGroupView)
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
