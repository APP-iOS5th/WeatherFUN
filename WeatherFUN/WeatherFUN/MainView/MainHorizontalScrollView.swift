//
//  MainHorizontalScrollView.swift
//  WeatherFUN
//
//  Created by 박성민 on 4/30/24.
//

import SwiftUI

struct MainHorizontalScrollView: View {
    //시간, 온도, 이미지,
    //상단 텍스트
    @StateObject var vm = FiveWeatherViewModel()
    var formattedDate: String {
        let currentTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: currentTime)
    }
    var body: some View {
        VStack {
            //let _ = print(vm.fiveDayWeatherDates)
            HStack{
                Text("날씨 어쩌구 저쩌구")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                    .frame(height: 30)
                Spacer()
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white)
            
            HStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(vm.today){ day in
                            VStack{
                                if vm.nowId == day.id{
                                    Text("지금")
                                        .fontWeight(.heavy)
                                        .font(.caption)
                                        .padding(.bottom, 5)
                                        .foregroundColor(.white)
                                }else{
                                    Text("\(day.time)시")
                                        .fontWeight(.heavy)
                                        .font(.caption)
                                        .padding(.bottom, 5)
                                        .foregroundColor(.white)
                                }
                                Image(systemName: day.image)
                                    .renderingMode(.original)
                                    .padding(.bottom, 5)
                                Text("\(Int(day.temp))˚")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .padding()
                        }
                    }
                    
                    
                }
            } //:HSTACK
            
        } //:VSTACK
        .background(Color.customGray)
        .cornerRadius(10)
        
    }
}

#Preview {
    MainHorizontalScrollView()
}
