//
//  WeatherDaysView.swift
//  WeatherFUN
//
//  Created by uunwon on 4/30/24.
//

import SwiftUI

struct WeatherDaysView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "calendar")
                Text("10-DAY FORECAST")
                    .font(.system(size: 12))
                Spacer()
            }
            .padding([.top, .leading])
            .foregroundStyle(.white.opacity(0.9))
            
            ForEach(0...5, id: \.self) { temp in
                Divider()
                    .overlay(Color.white.opacity(0.9))
                    .padding(.horizontal, 10)
                
                HStack {
                    Text("Today")
                        .bold()
                    Spacer()
                    
                    Image(systemName: "sun.min.fill")
                    Spacer()
                    
                    Text("14˚")
                        .bold()
                        .opacity(0.5)
                    
                    ZStack {
                        Rectangle().frame(width: 150, height: 5)
                            .cornerRadius(7)
                            .opacity(0.25)
                        
                        Rectangle().frame(width: 70, height: 5)
                            .cornerRadius(7)
                            .foregroundStyle(.green)
                    }
                    
                    Text("21˚")
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
    WeatherDaysView()
}
