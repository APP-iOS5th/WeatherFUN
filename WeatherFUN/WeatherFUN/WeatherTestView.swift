//
//  WeatherTestView.swift
//  WeatherFUN
//
//  Created by 정종원 on 4/30/24.
//

import SwiftUI
import CoreLocation

struct WeatherTestView: View {
    
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text(weatherViewModel.currentWeatherDatas["currentLocation"] ?? "N/A")
            Text(weatherViewModel.currentWeatherDatas["currentTemprature"] ?? "N/A")
            Text(weatherViewModel.currentWeatherDatas["currentTempratureDescription"] ?? "N/A")
            HStack {
                Text(weatherViewModel.currentWeatherDatas["currentMaxTemperature"] ?? "N/A")
                Text(weatherViewModel.currentWeatherDatas["currentMinTemperature"] ?? "N/A")
            }
        }
    }
}

#Preview {
    WeatherTestView()
}
