//
//  OneWeatherData.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import Foundation

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
