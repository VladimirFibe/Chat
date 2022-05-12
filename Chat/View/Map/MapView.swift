//
//  MapView.swift
//  Chat
//
//  Created by MacService on 05.05.2022.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapView: View {
  @EnvironmentObject var locationManager: LocationManager
  @State private var userTrackingMode: MapUserTrackingMode = .follow
  @ObservedObject var viewModel = MapViewModel()
  var body: some View {
    Map(coordinateRegion: $locationManager.region,
        interactionModes: .all,
        showsUserLocation: true,
        userTrackingMode: $userTrackingMode,
        annotationItems: viewModel.locations) { person in
      MapAnnotation(coordinate: person.location) {
        MapAnnotationView(location: person)
      }
    }
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarHidden(true)
        .onAppear {
          locationManager.enableLocationServices()
        }
        .overlay(
          Button(action: {
            
          }, label: {
            Text("Начать прогулку")
          })
          .buttonStyle(.borderedProminent)
          .tint(.blue)
          .padding()
          , alignment: .bottom
        )
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
      .environmentObject(LocationManager())
  }
}
