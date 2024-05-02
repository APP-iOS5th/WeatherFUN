//
//  WeekWeatherModel.swift
//  WeatherFUN
//
//  Created by uunwon on 5/2/24.
//

import Foundation

struct WeekWeatherModel {
    let time: String
    let weather: String
    let minTemperature: Int
    let maxTemperature: Int
    
    var weatherIcon: String {
        switch weather {
        case "clear":
            return "sun.max.fill"
        case "Thunderstorm":
            return "cloud.bolt.fill"
        case "Drizzle":
            return "cloud.drizzle.fill"
        case "Rain":
            return "cloud.heavyrain.fill"
        case "Snow":
            return "snowflake"
        case "Clouds":
            return "cloud.fill"
        default:
            return "smoke.fill"
        }
    }
}
