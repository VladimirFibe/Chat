//
//  LocationManager.swift
//  Chat
//
//  Created by MacService on 05.05.2022.
//

import Foundation
import CoreLocation
import MapKit
import CoreLocationUI
import Firebase

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
  let manager = CLLocationManager()
  @Published var location: CLLocationCoordinate2D?
  @Published var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 53.339404, longitude: 83.772956),
    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
  @Published var isLoading = false
  
  override init() {
    super.init()
    manager.delegate = self
  }
  
  func requestLocation() {
    isLoading = true
    manager.requestLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    location = locations.first?.coordinate
    if let location = location {
      region.center = location
      guard let uid = Auth.auth().currentUser?.uid else { return }
      COLLECTION_PERSONS.document(uid).updateData([
        "latitude": location.latitude,
        "longitude": location.longitude,
      ])
    }
    isLoading = false
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("DEBUG: Error getting location \(error.localizedDescription)")
    isLoading = false
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedWhenInUse {
      manager.requestAlwaysAuthorization()
    }
  }
  
  func enableLocationServices() {
    switch CLLocationManager.authorizationStatus() {
      
    case .notDetermined:
      manager.requestWhenInUseAuthorization()
    case .restricted:
      break
    case .denied:
      break
    case .authorizedAlways:
      manager.startUpdatingLocation()
      manager.desiredAccuracy = kCLLocationAccuracyBest
    case .authorizedWhenInUse:
      manager.requestAlwaysAuthorization()
    @unknown default:
      break
    }
  }
}
