//
//  WeatherModel.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var weatherNetwork = WeatherNetwork()
    @Published var locationManager: LocationManager = LocationManager()
    @Published var currentWeatherDatas: [String : String] = [:]
    @Published var fiveDayWeatherDates: [FiveWeatherModel] = []
    
    init() {
        locationManager.weatherViewModel = self
        locationManager.requestLocation()
    }
    
    
//    func fetchCurrentWeatherData() {
//        //if let cityName = weatherNetwork.weatherDatas.first?.city.name,
//           let temperature = weatherNetwork.oneDayWeatherDatas?.main.temp,
//           let currentTempratureDescription = weatherNetwork.oneDayWeatherDatas?.weather.first?.description,
//           let minTemperature = weatherNetwork.oneDayWeatherDatas?.main.temp_min,
//           let maxTemperature = weatherNetwork.oneDayWeatherDatas?.main.temp_max
//        {
//            currentWeatherDatas.updateValue(cityName, forKey: "currentLocation")
//            currentWeatherDatas.updateValue("\(temperature)", forKey: "currentTemprature")
//            currentWeatherDatas.updateValue(currentTempratureDescription, forKey: "currentTempratureDescription")
//            currentWeatherDatas.updateValue("\(minTemperature)", forKey: "currentMinTemperature")
//            currentWeatherDatas.updateValue("\(maxTemperature)", forKey: "currentMaxTemperature")
//        } else {
//            currentWeatherDatas.updateValue("N/A", forKey: "currentLocation")
//            currentWeatherDatas.updateValue("N/A", forKey: "currentTemperature")
//            currentWeatherDatas.updateValue("N/A", forKey: "currentTemperatureDescription")
//            currentWeatherDatas.updateValue("N/A", forKey: "currentMinTemperature")
//            currentWeatherDatas.updateValue("N/A", forKey: "currentMaxTemperature")
//        }
//    }
    func fetchCurrentWeatherData() {
        if let cityName = weatherNetwork.oneDayWeatherDatas?.name,
           let temperature = weatherNetwork.oneDayWeatherDatas?.main.temp,
           let currentTempratureDescription = weatherNetwork.oneDayWeatherDatas?.weather.first?.description,
           let minTemperature = weatherNetwork.oneDayWeatherDatas?.main.temp_min,
           let maxTemperature = weatherNetwork.oneDayWeatherDatas?.main.temp_max
        {
            currentWeatherDatas.updateValue(cityName, forKey: "currentLocation")
            currentWeatherDatas.updateValue("\(temperature)", forKey: "currentTemprature")
            currentWeatherDatas.updateValue(currentTempratureDescription, forKey: "currentTempratureDescription")
            currentWeatherDatas.updateValue("\(minTemperature)", forKey: "currentMinTemperature")
            currentWeatherDatas.updateValue("\(maxTemperature)", forKey: "currentMaxTemperature")
        } else {
            currentWeatherDatas.updateValue("N/A", forKey: "currentLocation")
            currentWeatherDatas.updateValue("N/A", forKey: "currentTemperature")
            currentWeatherDatas.updateValue("N/A", forKey: "currentTemperatureDescription")
            currentWeatherDatas.updateValue("N/A", forKey: "currentMinTemperature")
            currentWeatherDatas.updateValue("N/A", forKey: "currentMaxTemperature")
        }
    }
    
}

