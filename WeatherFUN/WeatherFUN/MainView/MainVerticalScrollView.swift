//
//  WeatherDaysView.swift
//  WeatherFUN
//
//  Created by uunwon on 4/30/24.
//

import SwiftUI

struct MainVerticalScrollView: View {
    
    @StateObject var weekWeatherViewModel = WeekWeatherViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "calendar")
                Text("5-DAY FORECAST")
                    .font(.system(size: 12))
                Spacer()
            }
            .padding([.top, .leading])
            .foregroundStyle(.white.opacity(0.9))
            
            ForEach(weekWeatherViewModel.weekDatas) { day in
                Divider()
                    .overlay(Color.white.opacity(0.9))
                    .padding(.horizontal, 10)
                
                HStack {
                    Text("\(day.time)일")
                        .bold()
                    Spacer()
                    
                    Image(systemName: day.weatherIcon)
                    Spacer()
                    
                    Text("\(day.minTemperature)˚")
                        .bold()
                        .opacity(0.5)
                    
                    TemperatureBarView(minTemperature: day.minTemperature, maxTemperature: day.maxTemperature)
                    
                    Text("\(day.maxTemperature)˚")
                        .bold()
                }
                .foregroundStyle(.white)
                .padding(10)
            }
        } // VStack
        .background(Color.customGray)
        .cornerRadius(10)
    }
}

#Preview {
    MainVerticalScrollView()
}
