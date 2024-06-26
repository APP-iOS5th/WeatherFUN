//
//  WeatherNetwork.swift
//  WeatherFUN
//
//  Created by 정종원 on 4/30/24.
//

import Foundation
import CoreLocation


class OneDayWeatherNetwork: ObservableObject {
        
    @Published var oneDayWeatherDatas: OneWeatherData?
    
    let oneDayURL = "https://api.openweathermap.org/data/2.5/weather?&appid=2723e90839d963b6c533d30b9d1bacc9&units=metric"
    
    func fetchWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping () -> Void) {
        
        let oneDayurlString = "\(oneDayURL)&lat=\(latitude)&lon=\(longitude)"
        guard let url2 = URL(string: oneDayurlString) else {
            print("Invalid URL")
            return
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
                let weatherResponse = try decoder.decode(OneWeatherData.self, from: data)
                
                DispatchQueue.main.async {
                    self.oneDayWeatherDatas = weatherResponse
                    completion()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task2.resume()
    }
}
