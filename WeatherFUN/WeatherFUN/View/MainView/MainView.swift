//
//  MainView.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var weatherNetwork = WeatherNetwork()
    @StateObject var locationManager: LocationManager = LocationManager()
    //@State var weatherDatas: WeatherData?
    @StateObject var weatherVM = WeatherViewModel()
    var body: some View {
        VStack{
           // Text(weatherVM.today())
//            let _ = print("-----하루----")
//            let _ = print(String(weatherNetwork.OneweatherData?.temperature ?? 0.0))
            TodayView(vm: weatherVM)
            MainHorizontalScrollView()
                .padding(.horizontal, 10)
            MainVerticalScrollView()
                .padding(.horizontal, 10)
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
    MainView()
}
