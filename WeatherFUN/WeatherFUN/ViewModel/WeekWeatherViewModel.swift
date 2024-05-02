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
        
        // 첫번째 인덱스에는 오늘의 데이터, 두번째 인덱스에는 내일의 데이터 ..
        var weekWeatherData : [[WeekWeatherModel]] = Array(repeating: [WeekWeatherModel], count: 5)
        var formattedDate: String {
                    let currentTime = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd"
                    return dateFormatter.string(from: currentTime)
                } //사용자의 현재 시간에서 시간만 가져옴
        
        // print(String((Int(formattedDate) ?? 0)+1))
        
        // weekWeatherDatas 날짜별로 배열을 만든다, time 잘라서 날짜만 보고 비교하도록
        for i in weekWeatherDatas {
            switch i.time.components(separatedBy: ["-", " "])[2]{
            case formattedDate:
                weekWeatherData[0].append(i)
            case String(format:"%02d", (Int(formattedDate) ?? 0)+1):
                weekWeatherData[1].append(i)
            case String(format:"%02d", (Int(formattedDate) ?? 0)+2):
                weekWeatherData[2].append(i)
            case String(format:"%02d", (Int(formattedDate) ?? 0)+3):
                weekWeatherData[3].append(i)
            case String(format:"%02d", (Int(formattedDate) ?? 0)+4):
                weekWeatherData[4].append(i)
            default:
                continue
            }
        }
        
        print(weekWeatherData[0])
        
        // 시간마다의 날씨를 딕셔너리로 받아서 많이 카운팅된걸 표시한다 !
    }
    
}
