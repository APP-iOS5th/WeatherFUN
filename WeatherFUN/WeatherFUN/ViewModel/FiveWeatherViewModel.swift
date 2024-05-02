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
    //@Published var locationManager: LocationManager = LocationManager()
    @Published var fiveDayWeatherDates: [FiveDayWeatherModel] = []
    @Published var today: [FiveDayWeatherModel] = []
    init() {
        LocationManager.shared.fiveDayWeatherViewModel = self
        LocationManager.shared.requestLocation()
    }
    
    func fetchCurrentWeatherData() {
        for i in fiveDayWeatherNetwork.weatherDatas[0].list {
            guard let time = i.dt_txt else {return}
            fiveDayWeatherDates.append(FiveDayWeatherModel(time: time, weather: i.weather[0].main, temp: i.main.temp))
        }
        let todayTime = Array(fiveDayWeatherDates[0].time) //8 ,9
        print(todayTime)
        for d in fiveDayWeatherDates {
            let t = Array(d.time)
            if todayTime[9] == t[9] {
                today.append(FiveDayWeatherModel(time: (String(t[11]) + String(t[12])), weather: d.weather, temp: d.temp))
            }else{
                break
            }
        }
       
    }
    
}

