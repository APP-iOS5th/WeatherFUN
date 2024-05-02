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
    init() {
        locationManager.requestLocation()
        weatherNetwork.fetchWeatherData(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)
    }
    
    // MARK: - 하루 날씨
    func todayLocation() -> String {
        if let today = weatherNetwork.OneweatherData{
            return today.locationName
        }
        return "한국일 껄?"
    }
    func todayTemp() -> String {
        if let temp = weatherNetwork.OneweatherData{
            return String(Int(temp.temperature))
        }
        return "--"
    }
//    func today
    
    // MARK: - 5일 날씨
    func todayMaxMinTemp() -> [String]{
        var max = -999999.0
        var min = 999999.0
        if !weatherNetwork.weatherDatas.isEmpty{
//            if let max = weatherNetwork.weatherDatas[0].list[0].main.temp_max{
//                return String(Int(max))
//            }
            let todayList = weatherNetwork.weatherDatas[0].list
            for i in todayList {
                if i.main.temp > max {
                    max = i.main.temp
                }
                if i.main.temp < min {
                    min = i.main.temp
                }
            }
            return [String(Int(max)), String(Int(min))]
        }
        return ["--","--"]
        
    }
    
}
//WeatherFUN.List(dt: 1714554000, main: WeatherFUN.Main(temp: 28.11, temp_min: Optional(28.11), temp_max: Optional(28.11)), weather: [WeatherFUN.Weather(id: 500, main: "Rain", description: "light rain")], dt_txt: Optional("2024-05-01 09:00:00")),
//WeatherFUN.List(dt: 1714564800, main: WeatherFUN.Main(temp: 28.11, temp_min: Optional(28.1), temp_max: Optional(28.11)), weather: [WeatherFUN.Weather(id: 501, main: "Rain", description: "moderate rain")], dt_txt: Optional("2024-05-01 12:00:00")),
// 14: 55
//[
//Optional("2024-05-01 18:00:00")
//Optional("2024-05-01 21:00:00")
//] //10
//Optional("2024-05-02 00:00:00")
//Optional("2024-05-02 03:00:00")
//Optional("2024-05-02 06:00:00")
//Optional("2024-05-02 09:00:00")
//Optional("2024-05-02 12:00:00")
//Optional("2024-05-02 15:00:00")
//Optional("2024-05-02 18:00:00")
//Optional("2024-05-02 21:00:00")

//[3,6,9,12,15,18,21,24]
//extension WeatherViewModel {
//}

//struct TestView: View {
//    @StateObject var weatherNetwork = WeatherNetwork()
//    @StateObject var locationManager: LocationManager = LocationManager()
//    @State var weatherDatas: WeatherData?
//    var body: some View {
//        VStack{
//            
//            ForEach(weatherNetwork.weatherDatas) { weather in
//                ForEach(weather.list) { list in
//                    let _ = print(list.dt_txt)
//                    
//                }
//                
//            }
//            
//            MainHorizontalScrollView()
//                .frame(width: 360)
//        }
//        .onAppear {
//            locationManager.requestLocation()
//        }
//        .onReceive(locationManager.$location) { location in
//                    guard let location = location else { return }
//            weatherNetwork.fetchWeatherData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
////            print(location.coordinate.latitude)
////            print(location.coordinate.longitude)
//                }
//    }
//}
