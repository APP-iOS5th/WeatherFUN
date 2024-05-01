//
//  TestView.swift
//  WeatherFUN
//
//  Created by 박성민 on 4/30/24.
//

import SwiftUI

struct TestView: View {
    @StateObject var weatherNetwork = WeatherNetwork()
    @StateObject var locationManager: LocationManager = LocationManager()
    @State var weatherDatas: WeatherData?
    var body: some View {
        VStack{
            
            ForEach(weatherNetwork.weatherDatas) { weather in
                ForEach(weather.list) { list in
                    let _ = print(list.dt_txt)
                    
                }
                
            }
            
            MainHorizontalScrollView()
                .frame(width: 360)
        }
        .onAppear {
            locationManager.requestLocation()
        }
        .onReceive(locationManager.$location) { location in
                    guard let location = location else { return }
            weatherNetwork.fetchWeatherData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//            print(location.coordinate.latitude)
//            print(location.coordinate.longitude)
                }
    }
}

#Preview {
    TestView()
}
