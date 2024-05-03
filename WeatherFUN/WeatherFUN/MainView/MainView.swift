//
//  MainView.swift
//  WeatherFUN
//
//  Created by 박성민 on 5/1/24.
//

import SwiftUI
import SpriteKit

struct MainView: View {
    
    @EnvironmentObject var vm: OneDayWeatherViewModel
    @State var color1 =  LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        //            GeometryReader { _ in
        //                SpriteView(scene: RainFall(), options: [.allowsTransparency])
        //            }
        //            .ignoresSafeArea()
        //            .zIndex(0)
        
        VStack{
            TodayView()
            MainHorizontalScrollView()
                .padding(.horizontal, 10)
            MainVerticalScrollView()
                .padding(.horizontal, 10)
        }
        .background(color1
            .animation(.easeInOut)
        )
        .onAppear {
            color1 = vm.gradientBackgroundColor
        }
        .onReceive( vm.$gradientBackgroundColor ) { color in
            color1 = color
            print("color: \(color)")
        }

    }
}

#Preview {
    MainView()
}


class RainFall: SKScene {
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5, y: 1)
        
        backgroundColor = .clear
        //creating node and adding to scene
        let node = SKEmitterNode(fileNamed: "Rainfall.sks")!
        addChild(node)
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}
