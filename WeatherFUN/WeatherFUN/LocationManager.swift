//
//  LocationManager.swift
//  WeatherFUN
//
//  Created by 정종원 on 4/30/24.
//

import Foundation
import CoreLocation
import SwiftUI


class LocationManager: NSObject, ObservableObject {
    
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    
    @Published var location: CLLocation?
    
    var weatherViewModel: WeatherViewModel?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func updateWeatherData() {
        guard let viewModel = weatherViewModel, let location = location else { return }
        viewModel.weatherNetwork.fetchWeatherData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, completion: viewModel.fetchCurrentWeatherData)
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location
            print(location)
            
            updateWeatherData()
        }
    }
    
}
