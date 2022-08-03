//
//  ContentView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI

struct ContentView: View {
    
    
    fileprivate func TapBar() -> some View {
        return HStack{
            ForEach(TabBarList) { item in
                Spacer()
                Button(action: {
                    self.selectedTab = item.tag
                }){
                    VStack {
                        Image(systemName: self.selectedTab == item.tag ? item.iconTapped : item.icon)
                            .imageScale(.large)
                        Text(item.content).font(.system(size: 10, weight: .light))
                    }.frame(height: 70)
                        .padding(.bottom, 20)
                        .foregroundColor(self.selectedTab == item.tag ? Color.black : Color.gray)
                }
                Spacer()
            }
        }
        .background(Color.white)
        .cornerRadius(25, corners: [.topLeft, .topRight])
        .offset(y:UIScreen.main.bounds.size.height/2 - 40)
    }
    
    
    
    
    
    @State var selectedTab = "house"
    @State var isLoading: Bool = true
    init() {
        UITabBar.appearance().backgroundColor = UIColor.gray
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
                TabView(selection: $selectedTab){
                    ForEach(TabBarList){
                        item in
                        AnyView(_fromValue: item.page)
                            .tabItem{
                                EmptyView()
                            }.tag(item.tag)
                    }
                }
            }
            
            
            TapBar()
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
