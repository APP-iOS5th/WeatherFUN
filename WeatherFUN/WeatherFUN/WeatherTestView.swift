//
//  WeatherTestView.swift
//  WeatherFUN
//
//  Created by 정종원 on 4/30/24.
//

import SwiftUI
import CoreLocation

struct WeatherTestView: View {
    
    @StateObject var weatherNetwork = WeatherNetwork()
    //@StateObject var oneWeatherNetwork = WeatherNetwork()
    @StateObject var locationManager: LocationManager = LocationManager()
    
    var body: some View {
        VStack {
//            Text("Latitude: \(String(describing: locationManager.location?.coordinate.latitude.description))")
//            Text("Longitude: \(String(describing: locationManager.location?.coordinate.longitude.description))")
//            
//            Text("weatherData: \(String(describing: weatherNetwork.weatherDatas.first?.list[0].main))")
//            
            Text("weatherData: \(String(describing: weatherNetwork.weatherDatas))")
//            Text("Latitude: \(String(describing: locationManager.location?.coordinate.latitude.description))")
//            Text("Longitude: \(String(describing: locationManager.location?.coordinate.longitude.description))")
//            
//            Text("weatherData: \(String(describing: weatherNetwork.weatherDatas.first?.list[0].main))")
//            Text("Test: \(weatherNetwork.OneweatherData?.temperature)")
            ForEach(weatherNetwork.weatherDatas) { weather in
                let _ = print(weather)
                
            }
            

        }
        .onAppear {
            self.weatherNetwork.fetchWeatherData(latitude: locationManager.location?.coordinate.latitude ?? 37.785834, longitude: locationManager.location?.coordinate.longitude ?? -122.406417)
        }

    }
}

#Preview {
    WeatherTestView()
}
