//
//  FiveWeatherModel.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/2/24.
//

import Foundation

struct FiveDayWeatherModel: Identifiable {
    let id = UUID()
    let time: String
    let weather: String
    let temp: Double
    var image: String {
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
