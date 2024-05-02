//
//  TodayView.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import SwiftUI

struct TodayView: View {
//    @Binding var title: String
//    @Binding var location: String
//    @Binding var temp: Int
//    @Binding var maxTemp: Int
//    @Binding var minTemp: Int
    @StateObject var vm: WeatherViewModel
    var body: some View {
        VStack {
            Text("나의 위치")
                .font(.largeTitle)
            Text("\(vm.todayLocation())")
                .font(.caption)
            Text("\(vm.todayTemp())˚")
                .font(.system(size: 100))
                .padding(.leading, 20)
                
            Text("흐림")
                .padding(.trailing, 20)
           // Text("최고: \(vm.todayMaxMinTemp())˚  최저: \(vm.todayMinTemp())˚")
            
            
        }
    
    }
}

//#Preview {
//    TodayView()
//}
