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
    @Published var currentWeatherDatas: [String : String] = [:]
    @Published var gradientBackgroundColor = LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
//    @Published var gradientBackgroundColor = LinearGradient(gradient: Gradient(colors: [Color(red: 0.87, green: 0.98, blue: 0.98), Color(red: 0.28, green: 0.20, blue: 0.83)]), startPoint: .topLeading, endPoint: .bottomTrailing)

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
        changeGradientBackgroundColor()
//        gradientBackgroundColor = changeGradientBackgroundColor()
        print("gradientBackgroundColor :\(gradientBackgroundColor)")
    }
    
    func changeGradientBackgroundColor() {
        
//        guard let weather = oneDayWeatherNetwork.oneDayWeatherDatas?.weather.first?.main else { return }
        print(oneDayWeatherNetwork.oneDayWeatherDatas?.weather.first?.main)
        if let weather = oneDayWeatherNetwork.oneDayWeatherDatas?.weather.first?.main {
            
            let startColor: Color
            let endColor: Color
            
            switch weather {
            case "Clear":
                startColor = Color(red: 0.87, green: 0.98, blue: 0.98)
                endColor = Color(red: 0.28, green: 0.20, blue: 0.83)
                gradientBackgroundColor = LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            case "Thunderstorm":
                startColor = Color(red: 0.07, green: 0.06, blue: 0.25)
                endColor = Color(red: 0.98, green: 0.79, blue: 0.14)
                gradientBackgroundColor = LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            case "Drizzle":
                startColor = Color(red: 0.12, green: 0.15, blue: 0.18)
                endColor = Color(red: 0.28, green: 0.33, blue: 0.38)
                gradientBackgroundColor = LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            case "Rain":
                startColor = Color(red: 0.12, green: 0.15, blue: 0.18)
                endColor = Color(red: 0.28, green: 0.33, blue: 0.38)
                gradientBackgroundColor = LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            case "Snow":
                startColor = Color(red: 0.58, green: 0.65, blue: 0.65)
                endColor = Color(red: 0.50, green: 0.55, blue: 0.55)
                gradientBackgroundColor = LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            case "Clouds":
                startColor = Color(red: 0.12, green: 0.15, blue: 0.18)
                endColor = Color(red: 0.28, green: 0.33, blue: 0.38)
                gradientBackgroundColor = LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
            default:
                break
            }
            
            print("Func gradientBackgroundColor :\(gradientBackgroundColor)")
    //        return LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}

/*
 //clear
 UIColor(red: 0.87, green: 0.98, blue: 0.98, alpha: 1.00)
 UIColor(red: 0.28, green: 0.20, blue: 0.83, alpha: 1.00)
 
 //Thunderstorm
 UIColor(red: 0.07, green: 0.06, blue: 0.25, alpha: 1.00)
 UIColor(red: 0.98, green: 0.79, blue: 0.14, alpha: 1.00)
 
 //Drizzle ,Clouds
 UIColor(red: 0.12, green: 0.15, blue: 0.18, alpha: 1.00)
 UIColor(red: 0.28, green: 0.33, blue: 0.38, alpha: 1.00)
 
 //Rain
 UIColor(red: 0.12, green: 0.15, blue: 0.18, alpha: 1.00)
 UIColor(red: 0.28, green: 0.33, blue: 0.38, alpha: 1.00)
 
 //Snow
 
 UIColor(red: 0.58, green: 0.65, blue: 0.65, alpha: 1.00)
 UIColor(red: 0.50, green: 0.55, blue: 0.55, alpha: 1.00)
 */

