//
//  MainView.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var weatherViewModel = OneDayWeatherViewModel()

    var body: some View {
        VStack{
            TodayView()
            MainHorizontalScrollView()
                .padding(.horizontal, 10)
            MainVerticalScrollView()
                .padding(.horizontal, 10)
        }
        .onAppear{
            weatherViewModel.colorChange()
        }
        .background(weatherViewModel.backgroundColor)

    }
}

#Preview {
    MainView()
}
