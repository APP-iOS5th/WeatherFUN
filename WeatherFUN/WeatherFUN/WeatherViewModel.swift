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
    init(weatherNetwork: WeatherNetwork = WeatherNetwork(), locationManager: LocationManager) {
        weatherNetwork.fetchWeatherData(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)
        self.weatherNetwork = weatherNetwork
        self.locationManager = locationManager
    }
    
}
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
