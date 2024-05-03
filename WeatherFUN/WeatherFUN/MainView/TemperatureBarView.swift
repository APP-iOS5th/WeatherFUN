//
//  TemperatureBar.swift
//  WeatherFUN
//
//  Created by uunwon on 5/3/24.
//

import SwiftUI

struct TemperatureBarView: View {
    let minTemperature: Int
    let maxTemperature: Int
    
    let barWidth: CGFloat = 150
    let barHeight: CGFloat = 5
    
    let startTemperature: CGFloat = 0
    let endTemperature: CGFloat = 20
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: barWidth, height: barHeight)
                .cornerRadius(barHeight / 2)
                .opacity(0.25)
            
            Rectangle()
                .frame(width: calculateBarWidth(), height: barHeight)
                .cornerRadius(barHeight / 2)
                .foregroundColor(.green)
        }
    }
    
    private func calculateBarWidth() -> CGFloat {
        let totalRange = endTemperature - startTemperature
        let temperatureRange = CGFloat(maxTemperature - minTemperature)
        
        let ratio = temperatureRange / totalRange
        return barWidth * ratio
    }
}

struct TemperatureBar_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureBarView(minTemperature: 10, maxTemperature: 15)
            .frame(width: 200, height: 50)
            .padding()
    }
}
