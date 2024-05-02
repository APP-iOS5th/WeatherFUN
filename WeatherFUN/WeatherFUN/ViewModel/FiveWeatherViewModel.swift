//
//  WeatherModel.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import Foundation
import SwiftUI

class FiveWeatherViewModel: ObservableObject {
    @Published var weatherNetwork = FiveWeatherNetwork()
    @Published var locationManager: LocationManager = LocationManager()
    @Published var fiveDayWeatherDates: [FiveWeatherModel] = []
    
    func fetchCurrentWeatherData() {
        for i in weatherNetwork.weatherDatas[0].list {
            guard let time = i.dt_txt else {return}
            fiveDayWeatherDates.append(FiveWeatherModel(time: time, weather: i.weather[0].main, temp: i.main.temp))
        }
       
    }
    
}

