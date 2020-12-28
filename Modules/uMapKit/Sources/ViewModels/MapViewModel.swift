//
//  MapViewModel.swift
//  
//
//  Created by Mateus Sousa on 26/12/20.
//

import UIKit
import MapKit
import CoreLocation
import SwiftUI

class MapViewModel: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    private var userLocation = MKCoordinateRegion()
    @Published var location = MKCoordinateRegion()
//    @Published var places = [Place]()
    
    
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func goUserLocation() {
        location = userLocation
    }
    
//    func setPinUserLocation() -> [MapMarker] {
//        let positionUser = Place(name: "userLocation", latitude: userLocation.center.latitude, longitude: userLocation.center.longitude)
//        return [positionUser]
//    }
}

extension MapViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        userLocation = MKCoordinateRegion(center: locValue, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        location = userLocation
    }
}
