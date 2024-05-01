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
    @State var weatherDatas: WeatherData?
    var body: some View {
        VStack{
            TodayView()
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
