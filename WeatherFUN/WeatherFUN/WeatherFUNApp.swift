//
//  WeatherFUNApp.swift
//  WeatherFUN
//
//  Created by 정종원 on 4/30/24.
//

import SwiftUI

@main
struct WeatherFUNApp: App {
    @StateObject var vm = OneDayWeatherViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vm)
        }
    }
}
