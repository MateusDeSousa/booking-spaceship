//
//  MapViewModel.swift
//  
//
//  Created by Mateus Sousa on 26/12/20.
//

import MapKit
import CoreLocation
import SwiftUI
import uNetwork

class MapViewModel: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    private var userLocation = MKCoordinateRegion()
    @Published var location = MKCoordinateRegion()
    @Published var availableCars = [AvailableCarModel]()
    @Published var error: Error?
    
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
    
    func findAvailableCars() {
        let network = NetworkManager()
        network.getAvailableCars { result in
            switch result {
            case .success(let data):
                do{
                    let cars = try JSONDecoder().decode([AvailableCarModel].self, from: data)
                    self.availableCars = cars
                }catch {
                    self.error = error
                }
            case .failure(let error):
                self.error = error
            }
        }
    }
}

extension MapViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        userLocation = MKCoordinateRegion(center: locValue, span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006))
        location = userLocation
    }
}
