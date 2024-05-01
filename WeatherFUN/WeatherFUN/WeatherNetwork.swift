//
//  WeatherNetwork.swift
//  WeatherFUN
//
//  Created by 정종원 on 4/30/24.
//

import Foundation
import CoreLocation


class WeatherNetwork: ObservableObject {
    @Published var weatherDatas = [WeatherData]()
    @Published var OneweatherData: OneWeatherData?
    let weatherURL = "https://api.openweathermap.org/data/2.5/forecast?appid=2723e90839d963b6c533d30b9d1bacc9&units=metric"
    let oneDayURL = "https://api.openweathermap.org/data/2.5/weather?&appid=2723e90839d963b6c533d30b9d1bacc9&units=metric"
    
    func fetchWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        let oneDayurlString = "\(oneDayURL)&lat=\(latitude)&lon=\(longitude)"
        
        
        guard let url1 = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        guard let url2 = URL(string: oneDayurlString) else {
            print("Invalid URL")
            return
        }
        // MARK: - 5일짜리 api 호출
        let task = URLSession.shared.dataTask(with: url1) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherDecodedData = try decoder.decode(WeatherData.self, from: data)
                
                DispatchQueue.main.async {
                    self.weatherDatas = [weatherDecodedData]
                }
                
                print("\(weatherDecodedData) \n")
            } catch {
                print(error)
            }
        }
        
        // MARK: - 하루짜리 api 호출
        let task2 = URLSession.shared.dataTask(with: url2) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(OneWeatherResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.OneweatherData = OneWeatherData(
                        locationName: weatherResponse.name,
                        temperature: weatherResponse.main.temp,
                        condition: weatherResponse.weather.first?.description ?? ""
                    )
                }
                
                //print("\(weatherDecodedData) \n")
            } catch {
                print(error.localizedDescription)
            }
        }
        task2.resume()
    }
}
