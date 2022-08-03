//
//  MainView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI


struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct MainView: View {
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "BackgroundColor")
    }
    @State var SectionOffset = -50.0
    var body: some View {
        VStack(){
            NavigationView{
                ZStack{
                    Color("BackgroundColor").ignoresSafeArea()
                    ScrollView{
                        VStack(spacing: 10){
                            
                            LazyVStack(spacing: 10, pinnedViews: .sectionFooters) {
                                Section(footer: TossBankView().offset(y: SectionOffset)) {
                                    TossBankView()
                                    AssetsView()
                                }
                                AssetsView()
                                AssetsView()
                            }
                            
                            VStack{
                                HStack{
                                    Text("금액 숨기기")
                                    Divider()
                                    Text("자산 추가")
                                }.frame(height: 20)
                            }.frame(height: 180, alignment: .center)
                        }.background(GeometryReader {
                            Color.clear.preference(key: ViewOffsetKey.self,
                                                   value: -$0.frame(in: .named("scroll")).origin.y)
                        })
                    }
                    .onPreferenceChange(ViewOffsetKey.self) { if $0 > -50 {
                        withAnimation{
                            SectionOffset = 0
                        }
                    }else if $0 < 0 {
                        withAnimation{
                            SectionOffset = -50.0
                        }
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
