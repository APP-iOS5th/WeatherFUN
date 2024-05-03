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
    let list: [List]
    let city: City
}

// MARK: - List
struct List: Decodable, Identifiable {
    var id: String {
        return String(dt)
    }
    let dt: Int
    let main: Main //온도
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
    let main: String
}

//MARK: - City
struct City: Decodable {
    let name: String
}
