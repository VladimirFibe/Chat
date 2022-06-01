//
//  AccountView.swift
//  Chat
//
//  Created by MacService on 31.05.2022.
//

import SwiftUI

struct AccountView: View {
  var body: some View {
    NavigationView {
      List {
        VStack(spacing: 8.0) {
          Image(systemName: "person.crop.circle.fill.badge.checkmark")
            .font(.system(size: 32))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.blue, .blue.opacity(0.3))
            .padding()
            .background(Circle().fill(.ultraThinMaterial))
            .background(Image(systemName: "hexagon")
              .symbolVariant(.fill)
              .foregroundColor(.blue)
              .font(.system(size: 200))
              .offset(x: -50, y: -100)
          )
          Text("Vladimir Fibe")
            .font(.title.weight(.semibold))
          HStack {
            Image(systemName: "location")
              .imageScale(.small)
            Text("Kazakhstan")
          }
          .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        Section {
          NavigationLink(destination: DCView()) {
            Label("Settings", systemImage: "gear")
          }
          NavigationLink { Text("Billing")} label: {
            Label("Billing", systemImage: "creditcard")
          }
          Label("Help", systemImage: "questionmark.circle")
        }
        
        Section {
          Link(destination: URL(string: "https:macservice.kz")!) {
            HStack {
              Label("Website", systemImage: "house")
              Spacer()
              Image(systemName: "link")
                .foregroundColor(.secondary)
            }
          }
          Link(destination: URL(string: "https://www.youtube.com/channel/UCPg3sUYrNNCVakL-CcrDJCQ")!) {
            HStack {
              Label("Youtube", systemImage: "tv")
              Spacer()
              Image(systemName: "link")
                .foregroundColor(.secondary)
            }
          }
        }
      }
      .accentColor(.primary)
      .listStyle(.insetGrouped)
      .navigationTitle("Account")
    }
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}
