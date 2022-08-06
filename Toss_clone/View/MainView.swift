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
    
    
    @ObservedObject var ObserbData = ObsbData
    @State var SectionOffset = 0.0
    var body: some View {
        VStack(){
            NavigationView{
                ZStack{
                    Color("BackgroundColor").ignoresSafeArea()
                    ScrollView{
                        VStack(spacing: defaultPadding){
                            
                            LazyVStack(spacing: 0, pinnedViews: .sectionFooters) {
                                Section(footer: SpendTopView().padding(.top, defaultPadding)) {
                                    TossBankView().padding(.top, defaultPadding)
                                    AssetsView().padding(.top, defaultPadding)
                                        .background(GeometryReader {
                                        Color.clear.preference(key: ViewOffsetKey.self,
                                                               value: -$0.frame(in: .named("scroll")).origin.y)
                                    })
                                }
                                SpendBottomView()
                            }
                            TossBankView()
                            TossBankView()
                            TossBankView()
                            
                            VStack{
                                HStack{
                                    Text("금액 숨기기").foregroundColor(Color("FontColor"))
                                    Divider()
                                    Text("자산 추가").foregroundColor(Color("FontColor"))
                                }.frame(height: 20)
                            }.frame(height: 180, alignment: .center)
                        }
                    }
                    .onPreferenceChange(ViewOffsetKey.self) {
                        let cellLocation = (CGFloat(AssetsValue.count) + 3.0) * cellHeight - UIScreen.main.bounds.size.height
                        if $0 < CGFloat(cellLocation + cellHeight) {
                            withAnimation{
                                ObserbData.LazyViewIsEnd = false
                            }
                        }
                        else if $0 > CGFloat(cellLocation + cellHeight) {
                            withAnimation{
                                ObserbData.LazyViewIsEnd = true
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
