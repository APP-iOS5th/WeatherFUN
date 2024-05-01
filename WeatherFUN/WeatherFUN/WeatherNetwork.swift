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
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/forecast?appid=2723e90839d963b6c533d30b9d1bacc9&units=metric"
    
    func fetchWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
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
        
        task.resume()
    }
}


