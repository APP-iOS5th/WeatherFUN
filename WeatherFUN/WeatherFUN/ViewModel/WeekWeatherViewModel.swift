//
//  WeekWeatherViewModel.swift
//  WeatherFUN
//
//  Created by uunwon on 5/2/24.
//

import Foundation
import SwiftUI

class WeekWeatherViewModel: ObservableObject {
    
    @Published var fiveDayWeatherNetwork = FiveDayWeatherNetwork()
    @Published var locationManager: LocationManager = LocationManager()
    @Published var weekWeatherDatas: [WeekWeatherModel] = []
    
    init() {
        LocationManager.shared.weekWeatherViewModel = self
        LocationManager.shared.requestLocation()
    }
    
    func fetchWeekWeatherData() {
        for i in fiveDayWeatherNetwork.weatherDatas[0].list {
            guard let time = i.dt_txt else {return}
            
            weekWeatherDatas.append(WeekWeatherModel(time: time, weather: i.weather[0].main, minTemperature: Int(i.main.temp_min ?? 0.0), maxTemperature: Int(i.main.temp_max ?? 0.0)))
        }
       
    }
    
}
