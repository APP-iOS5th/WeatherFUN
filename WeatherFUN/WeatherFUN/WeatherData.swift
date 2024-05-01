//
//  WeatherData.swift
//  WeatherFUN
//
//  Created by 정종원 on 4/30/24.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Decodable, Identifiable {
    var id: UUID {
      UUID()
    }
    //var id = UUID().uuidString
    let list: [List]
}

// MARK: - List
struct List: Decodable, Identifiable {
    var id: String {
        return String(dt)
    }
    let dt: Int
    let main: Main
    let weather: [Weather]
    let dt_txt: String? //날짜
}

// MARK: - MainClass
struct Main: Decodable {
    let temp: Double
    let temp_min, temp_max: Double?
}


// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
}
