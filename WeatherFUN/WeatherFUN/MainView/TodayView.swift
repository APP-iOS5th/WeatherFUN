//
//  TodayView.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import SwiftUI

struct TodayView: View {
    
    @StateObject var weatherViewModel = OneDayWeatherViewModel()
    
    var body: some View {
        VStack {
            Text("나의 위치")
                .font(.largeTitle)
            Text(weatherViewModel.currentWeatherDatas["currentLocation"] ?? "N/A")
            Text("\(weatherViewModel.currentWeatherDatas["currentTemprature"] ?? "N/A")˚")
                .font(.system(size: 100))
                .padding(.leading, 20)
            
            Text(weatherViewModel.currentWeatherDatas["currentTempratureDescription"] ?? "N/A")
                .padding(.trailing, 20)
            Text("최고: \(weatherViewModel.currentWeatherDatas["currentMaxTemperature"] ?? "N/A")˚  최저: \(weatherViewModel.currentWeatherDatas["currentMinTemperature"] ?? "N/A")˚")
        }
    }
}

#Preview {
    TodayView()
}
