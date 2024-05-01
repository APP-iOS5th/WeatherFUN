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
    @StateObject var locationManager: LocationManager = LocationManager()
    @State var weatherDatas: WeatherData?
    
    var body: some View {
        VStack {
            Text("Latitude: \(String(describing: locationManager.location?.coordinate.latitude.description))")
            Text("Longitude: \(String(describing: locationManager.location?.coordinate.longitude.description))")
            
            Text("weatherData: \(String(describing: weatherNetwork.weatherDatas.first?.list[0].main))")

        }
        .onAppear {
            self.weatherNetwork.fetchWeatherData(latitude: locationManager.location?.coordinate.latitude ?? 37.785834, longitude: locationManager.location?.coordinate.longitude ?? -122.406417)
        }
    }
}

#Preview {
    WeatherTestView()
}
