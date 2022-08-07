//
//  HorizentalScrollView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/07.
//

import SwiftUI

struct HorizentalScrollView: View {
    let assets:[HorizentalViewStruct] = [HorizentalViewStruct(Title: "요즘 인기", Content: "오늘의\n머니 팁", CellImage: UIImage(systemName: "lightbulb.fill"),Goto: AnyView(LaunchScreenView())),
                                         HorizentalViewStruct(Title: "최근", Content: "카드 혜택\n받기", CellImage: UIImage(systemName: "lanyardcard.fill"),Goto: AnyView(LaunchScreenView())),
                                         HorizentalViewStruct(Title: "자주", Content: "신용 점수\n올리기", CellImage: UIImage(systemName: "chevron.up.circle"),Goto: AnyView(LaunchScreenView())),
                                         HorizentalViewStruct(Title: "인기", Content: "더보기", CellImage: nil,Goto: AnyView(LaunchScreenView()))]
    let CellWidth:CGFloat = 136
    let CellHeight:CGFloat = 168
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: defaultPadding){
                ForEach(assets){ val in
                    let asset:HorizentalViewStruct = val
                    ZStack{
                        VStack(alignment: .leading){
                            Text(asset.Title).font(.footnote).foregroundColor(Color.gray)
                            Text(asset.Content).font(.headline).foregroundColor(Color("FontColor"))
                        }.padding([.horizontal, .vertical], defaultPadding * 2)
                        if asset.CellImage != nil{
                            Image(uiImage: asset.CellImage!)
                                .renderingMode(.template)
                                .foregroundColor(Color("FontColor"))
                                .offset(x: CellWidth/2 - defaultPadding, y: CellHeight/2 - defaultPadding)
                        }
                    }
                    .frame(width: CellWidth, height: CellHeight, alignment: .topLeading)
                    .background(Color("CellColor"))
                    .cornerRadius(defaultCornerRadious)
                    .padding([.vertical], 20)
                    
                }
            }
        }
    }
}

struct HorizentalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizentalScrollView()
    }
}
