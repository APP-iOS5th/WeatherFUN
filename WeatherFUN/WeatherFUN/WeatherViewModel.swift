//
//  WeatherModel.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var weatherNetwork = WeatherNetwork()
    @Published var locationManager: LocationManager = LocationManager()
    var currentWeatherDatas: [String : String] = [:]
    
    init() {
        locationManager.requestLocation()
        weatherNetwork.fetchWeatherData(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0, completion: fetchCurrentWeatherData)
    }
    
    //나의위치
    //인천광역시
    //20도
    //대체로 흐림
    //최고: 최저:
    
    func fetchCurrentWeatherData() {
        currentWeatherDatas.updateValue(currentLocation(), forKey: "currentLocation")
        currentWeatherDatas.updateValue(currentTemprature(), forKey: "currentTemprature")
        currentWeatherDatas.updateValue(currentTempratureDescription(), forKey: "currentTempratureDescription")
        currentWeatherDatas.updateValue(currentMinTemperature(), forKey: "currentMinTemperature")
        currentWeatherDatas.updateValue(currentMaxTemperature(), forKey: "currentMaxTemperature")
    }
    
    func currentLocation() -> String {
        return "\(String(describing: weatherNetwork.weatherDatas.first?.city.name))"
    }
    
    func currentTemprature() -> String {
        return "\(String(describing: weatherNetwork.oneDayWeatherDatas?.main.temp))"
    }
    
    func currentTempratureDescription() -> String {
        return "\(String(describing: weatherNetwork.oneDayWeatherDatas?.weather.first?.description))"
    }
    
    func currentMinTemperature() -> String {
        return "\(String(describing: weatherNetwork.oneDayWeatherDatas?.main.temp_min))"
    }
    
    func currentMaxTemperature() -> String {
        return "\(String(describing: weatherNetwork.oneDayWeatherDatas?.main.temp_max))"
    }
}

