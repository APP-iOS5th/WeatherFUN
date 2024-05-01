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

    var body: some View {
        VStack {
            Text("나의 위치")
                .font(.largeTitle)
            Text("대전 광역시")
                .font(.caption)
            Text("9˚")
                .font(.system(size: 100))
                .padding(.leading, 20)
                
            Text("흐림")
                .padding(.trailing, 20)
            Text("최고: 19˚  최저: 10˚")
            
            
        }
    
    }
}

#Preview {
    TodayView()
}
