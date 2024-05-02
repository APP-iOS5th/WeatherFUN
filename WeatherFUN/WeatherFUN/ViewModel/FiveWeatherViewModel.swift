//
//  WeatherModel.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import Foundation
import SwiftUI

class FiveWeatherViewModel: ObservableObject {
    
    @Published var fiveDayWeatherNetwork = FiveDayWeatherNetwork()
    @Published var locationManager: LocationManager = LocationManager()
    @Published var fiveDayWeatherDates: [FiveDayWeatherModel] = []
    
    init() {
        locationManager.fiveDayWeatherViewModel = self
        locationManager.requestLocation()
    }
    
    func fetchCurrentWeatherData() {
        for i in fiveDayWeatherNetwork.weatherDatas[0].list {
            guard let time = i.dt_txt else {return}
            fiveDayWeatherDates.append(FiveDayWeatherModel(time: time, weather: i.weather[0].main, temp: i.main.temp))
        }
       
    }
    
}

