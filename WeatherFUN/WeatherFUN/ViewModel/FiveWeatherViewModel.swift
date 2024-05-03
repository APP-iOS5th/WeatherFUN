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
    @Published var nowId: UUID = UUID()
    init() {
        LocationManager.shared.fiveDayWeatherViewModel = self
        LocationManager.shared.requestLocation()
    }
    
    func fetchCurrentWeatherData() {
        for i in fiveDayWeatherNetwork.weatherDatas[0].list {
            guard let time = i.dt_txt else {return}
            fiveDayWeatherDates.append(FiveDayWeatherModel(time: time, weather: i.weather[0].main, temp: i.main.temp))
        }
        let todayTime = Array(fiveDayWeatherDates[0].time) //첫날의 일을 가져옴
        let nextdayTime = Array(fiveDayWeatherDates[7].time) //둘째날의 일을 가져옴
        var formattedDate: String {
            let currentTime = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH"
            return dateFormatter.string(from: currentTime)
        }//사용자의 현재 시간에서 시간만 가져옴
        for d in fiveDayWeatherDates {
            let t = Array(d.time) //현재 도는 for문에 시간만 챙겨옴
            
            if (todayTime[9] == t[9] && Int(String(t[11]) + String(t[12]))! >= Int(formattedDate)! - 2){ //첫째날의 일과 같으면서 사용자의 시간보다 이미 지난 시간은 버려서 배열에 저장
                    today.append(FiveDayWeatherModel(time: (String(t[11]) + String(t[12])), weather: d.weather, temp: d.temp)) //3
                if today.count == 1 {
                    nowId = today[0].id
                }

        
            }else if nextdayTime[9] == t[9] && today.count < 10{ //만약에 첫날에 배열을 다 저장한 이후 배열의 갯수가 10개 될때까지 그 이후 배열에 값을 넣어줌
                today.append(FiveDayWeatherModel(time: (String(t[11]) + String(t[12])), weather: d.weather, temp: d.temp))
            }
            
        }
        
    }
    
}

