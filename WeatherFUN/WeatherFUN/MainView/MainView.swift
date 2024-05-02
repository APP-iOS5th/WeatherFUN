//
//  MainView.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        VStack{
            TodayView()
            MainHorizontalScrollView()
                .padding(.horizontal, 10)
            MainVerticalScrollView()
                .padding(.horizontal, 10)
        }

    }
}

#Preview {
    MainView()
}
