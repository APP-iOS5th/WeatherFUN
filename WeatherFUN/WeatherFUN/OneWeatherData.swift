//
//  OneWeatherData.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import Foundation
import CoreLocation

struct OneWeatherData {
    var locationName: String
    var temperature: Double
    var condition: String
}

struct OneWeatherResponse: Codable {
    let name: String
    let main: OneMainWeather
    let weather: [OneWeather]
}

struct OneMainWeather: Codable {
    let temp: Double
}

struct OneWeather: Codable {
    let description: String
}
