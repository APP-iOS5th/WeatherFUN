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
    
    var oneDayWeatherViewModel: OneDayWeatherViewModel?
    var fiveDayWeatherViewModel: FiveWeatherViewModel?
    
    
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
    
    func updateOneDayWeatherData() {
        guard let oneDayViewModel = oneDayWeatherViewModel, let location = location else { return }
        oneDayViewModel.oneDayWeatherNetwork.fetchWeatherData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, completion: oneDayViewModel.fetchCurrentWeatherData)
    }
    func updateFiveDayWeatherData() {
        guard let fiveDayViewModel = fiveDayWeatherViewModel, let location = location else { return }
        fiveDayViewModel.fiveDayWeatherNetwork.fetchWeatherData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, completion: fiveDayViewModel.fetchCurrentWeatherData)
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
            
            updateOneDayWeatherData()
            updateFiveDayWeatherData()
        }
    }
    
}
