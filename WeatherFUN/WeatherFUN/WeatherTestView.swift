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
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            
//            let _ = print(weatherViewModel.weatherNetwork.oneDayWeatherDatas?.name)
//            let _ = print(weatherViewModel.weatherNetwork.oneDayWeatherDatas?.main.temp)
//            let _ = print(weatherViewModel.weatherNetwork.oneDayWeatherDatas?.main.temp_min)
//            let _ = print(weatherViewModel.weatherNetwork.oneDayWeatherDatas?.main.temp_max)
//            let _ = print(weatherViewModel.weatherNetwork.oneDayWeatherDatas?.weather.first?.description)
            
            Text(weatherViewModel.currentWeatherDatas["currentLocation"] ?? "N/A")
            Text(weatherViewModel.currentWeatherDatas["currentTemprature"] ?? "N/A")
            Text(weatherViewModel.currentWeatherDatas["currentTempratureDescription"] ?? "N/A")
            HStack {
                Text(weatherViewModel.currentWeatherDatas["currentMaxTemperature"] ?? "N/A")
                Text(weatherViewModel.currentWeatherDatas["currentMinTemperature"] ?? "N/A")
            }
            
        }
        .onAppear {
            weatherNetwork.fetchWeatherData(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0, completion: weatherViewModel.fetchCurrentWeatherData)
        }

    }
}

#Preview {
    WeatherTestView()
}
