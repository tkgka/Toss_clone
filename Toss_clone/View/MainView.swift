//
//  MainView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI

struct MainView: View {
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "BackgroundColor")
    }
    var body: some View {
        VStack(){
            NavigationView{
                ZStack{
                    Color("BackgroundColor").ignoresSafeArea()
                    ScrollView{
                        VStack(spacing: 10){
                            TossBankView()
                            AssetsView()
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack{
                            Image("Logo")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .topTrailing)
                            Text("toss").font(Font.headline.weight(.black)).frame(alignment: .leading)
                        }.foregroundColor(.gray)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "message.fill")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "bell.fill")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                        
                    }
                }
                
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
