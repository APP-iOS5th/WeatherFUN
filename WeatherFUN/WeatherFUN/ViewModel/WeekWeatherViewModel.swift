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
    @Published var weekWeatherData: [[WeekWeatherModel]] = Array(repeating: [], count: 5)
    @Published var weekDatas: [WeekWeatherModel] = [] // 최최최종 데이터
    
    
    init() {
        LocationManager.shared.weekWeatherViewModel = self
        LocationManager.shared.requestLocation()
    }
    
    func getDayOfWeek(from date: Date) -> String? { // 요일 받아오기
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.weekday], from: date)
        
        if let weekday = components.weekday {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ko_KR")
            
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    func fetchWeekWeatherData() {
        for i in fiveDayWeatherNetwork.weatherDatas[0].list {
            guard let time = i.dt_txt else {return}
            
            weekWeatherDatas.append(WeekWeatherModel(time: time, weather: i.weather[0].main, minTemperature: Int(i.main.temp_min ?? 0.0), maxTemperature: Int(i.main.temp_max ?? 0.0)))
        }
        
        //사용자의 현재 시간에서 시간만 가져옴
        //사용자의 현재 시간에서 시간만 가져옴
        var formattedDate: String {
            let currentTime = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd"
            return dateFormatter.string(from: currentTime)
        }
        
        // weekWeatherDatas 날짜별로 배열을 만든다, time 잘라서 날짜만 보고 비교하도록
        for i in weekWeatherDatas {
            switch i.time.components(separatedBy: ["-", " "])[2]{
            case formattedDate:
                weekWeatherData[0].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
                weekWeatherData[0].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
            case String(format:"%02d", (Int(formattedDate) ?? 0)+1):
                weekWeatherData[1].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
                weekWeatherData[1].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
            case String(format:"%02d", (Int(formattedDate) ?? 0)+2):
                weekWeatherData[2].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
                weekWeatherData[2].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
            case String(format:"%02d", (Int(formattedDate) ?? 0)+3):
                weekWeatherData[3].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
                weekWeatherData[3].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
            case String(format:"%02d", (Int(formattedDate) ?? 0)+4):
                weekWeatherData[4].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
                weekWeatherData[4].append(WeekWeatherModel(time: i.time, weather: i.weather, minTemperature: i.minTemperature, maxTemperature: i.maxTemperature))
            default:
                continue
            }
        }
        
        // 최대 temp 최소 temp, 평균 아이콘
        // 시간마다의 날씨를 딕셔너리로 받아서 많이 카운팅된걸 표시한다 !
        for i in weekWeatherData.indices { // indices 메서드로 배열의 인덱스에 접근
            let weekData = weekWeatherData[i]
            
            var minTemp : Int = 50 // Int.max
            var maxTemp : Int = -50 // Int.min
            var weatherCounts: [String : Int] = [:]
            
            for model in weekData {
                if model.minTemperature < minTemp {
                    minTemp = model.minTemperature
                }
                
                if model.maxTemperature > maxTemp {
                    maxTemp = model.maxTemperature
                }
                
                if let count = weatherCounts[model.weather] {
                    weatherCounts[model.weather] = count+1
                } else {
                    weatherCounts[model.weather] = 1
                }
            }
            
            var mostCommonWeather: String = ""
            var maxCount = 0
            for (weather, count) in weatherCounts {
                if count > maxCount {
                    mostCommonWeather = weather
                    maxCount = count
                }
            }
            
            let dateString = String(weekData[0].time.split(separator: " ")[0])
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: dateString) {
                if let dayOfWeek = getDayOfWeek(from: date) {
                    if i == 0 {
                        weekDatas.append(WeekWeatherModel(time: "오늘", weather: mostCommonWeather, minTemperature: minTemp, maxTemperature: maxTemp))
                    } else {
                        weekDatas.append(WeekWeatherModel(time: String(dayOfWeek.prefix(1)), weather: mostCommonWeather, minTemperature: minTemp, maxTemperature: maxTemp))
                    }
                    // print(dayOfWeek) // 출력 : _ 요일
                } else {
                    print("요일을 가져올 수 없습니다")
                }
            } else {
                print("유효하지 않은 날짜 형식입니다")
            }
        }
        
       // print(weekDatas)
        
    }
    
}
