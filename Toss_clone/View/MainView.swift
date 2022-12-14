//
//  MainView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI
import Popovers



struct MainView: View { 
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "BackgroundColor")
    }
    @ObservedObject var ObserbData = ObsbData
    @State var SectionOffset = 0.0
    @State var present = false
    var body: some View {
        VStack{
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
                            GroupView()
                            HorizentalScrollView()
                            VStack{
                                HStack{
                                    Text("금액 숨기기")
                                    Divider()
                                    Text("자산 추가")
                                }.frame(height: 20)
                            }.frame(height: 100, alignment: .top)
                                .foregroundColor(Color("FontColor"))
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
                    TabBar()
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action:{
                            present = true}) {
                                HStack{
                                    Image("Logo")
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 50, height: 50, alignment: .topTrailing)
                                    Text("toss").font(Font.headline.weight(.black)).frame(alignment: .leading)
                                }.foregroundColor(.gray)
                            }.popover(isPresented: $present) {
                                DescriptionView(Present: $present)
                            }
                        
                        
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
                }.navigationBarTitleDisplayMode(.inline)
                
            }
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
