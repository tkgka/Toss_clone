//
//  ContentView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    @State var isLoading: Bool = true
    var body: some View {
        
        ZStack {
            // Launch Screen
            if isLoading {
                // 2) CHANGED: transition and zIndex added
                LaunchScreenView().transition(.opacity).zIndex(1)
            }
            else {
                // App Screen
                TabView(selection:$selection){
                    MainView().tabItem{
                        Image(systemName: "house")
                        Text("홈")
                    }
                    LaunchScreenView().tabItem{
                        Image(systemName: "suit.diamond.fill")
                        Text("혜택")
                    }
                    LaunchScreenView().tabItem{
                        Image(systemName: "wonsign.circle.fill")
                        Text("송금")
                    }
                    LaunchScreenView().tabItem{
                        Image(systemName: "chart.bar.fill")
                        Text("주식")
                    }
                    LaunchScreenView().tabItem{
                        Image(systemName: "line.3.horizontal")
                        Text("전체")
                    }
                }.accentColor(.black)
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                withAnimation{
                    isLoading.toggle()
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
