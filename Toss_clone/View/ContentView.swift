//
//  ContentView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI

struct ContentView: View {    
    @State var isLoading: Bool = true
    @ObservedObject var ObserbData = ObsbData
    
    init() {
        UITabBar.appearance().isHidden = true
        
    }
    
    var body: some View {
        
        ZStack {
            // Launch Screen
            if isLoading {
                // 2) CHANGED: transition and zIndex added
                LaunchScreenView().transition(.opacity).zIndex(1)
            }
            else {
                // App Screen
                TabView(selection: $ObserbData.selectedTab){
                    ForEach(TabBarList){
                        item in
                        AnyView(_fromValue: item.page)
                            .tabItem{
                                EmptyView()
                            }.tag(item.tag)
                    }
                }
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
