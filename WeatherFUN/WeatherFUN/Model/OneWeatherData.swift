//
//  OneWeatherData.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import Foundation

//struct OneWeatherData {
//    var locationName: String
//    var temperature: Double
//    var temp_min: Double
//    var temp_max: Double
//    var condition: String
//}
//
//struct OneWeatherResponse: Codable {
//    let name: String
//    let main: OneMainWeather
//    let weather: [OneWeather]
//}
//
//struct OneMainWeather: Codable {
//    let temp: Double
//}
//
//struct OneWeather: Codable {
//    let description: String
//}

// MARK: - Welcome
struct OneWeatherData: Codable {
    let weather: [OneDayWeather]
    let main: OneDayMain
    let name: String
}

// MARK: - Main
struct OneDayMain: Codable {
    let temp, temp_min, temp_max: Double?
}

// MARK: - Weather
struct OneDayWeather: Codable {
    let id: Int
    let main, description: String
}
