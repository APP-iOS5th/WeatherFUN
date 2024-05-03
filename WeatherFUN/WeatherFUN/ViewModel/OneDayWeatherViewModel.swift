//
//  WeatherModel.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import Foundation
import SwiftUI

class OneDayWeatherViewModel: ObservableObject {
    
    @Published var oneDayWeatherNetwork = OneDayWeatherNetwork()
    //@Published var locationManager: LocationManager = LocationManager()
    @Published var currentWeatherDatas: [String : String] = [:]
    @Published var backgroundColor: Color = .white
    init() {
        LocationManager.shared.oneDayWeatherViewModel = self
        LocationManager.shared.requestLocation()
    }

    func fetchCurrentWeatherData() {
        if let cityName = oneDayWeatherNetwork.oneDayWeatherDatas?.name,
           let temperature = oneDayWeatherNetwork.oneDayWeatherDatas?.main.temp,
           let currentTempratureDescription = oneDayWeatherNetwork.oneDayWeatherDatas?.weather.first?.description,
           let minTemperature = oneDayWeatherNetwork.oneDayWeatherDatas?.main.temp_min,
           let maxTemperature = oneDayWeatherNetwork.oneDayWeatherDatas?.main.temp_max
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
    func colorChange() {
        switch oneDayWeatherNetwork.oneDayWeatherDatas?.weather.first?.description {
        case "clear":
            backgroundColor = .mint
        case "Thunderstorm":
            backgroundColor = .mint
        case "Drizzle":
            backgroundColor = .mint
        case "Rain":
            backgroundColor = .mint
        case "Snow":
            backgroundColor = .mint
        case "Clouds":
            backgroundColor = .mint
        default:
            backgroundColor = .mint
        }
    }
    
}

