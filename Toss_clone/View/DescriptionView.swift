//
//  Description.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/07.
//

import SwiftUI

struct DescriptionView: View {
    @Binding var Present:Bool
    @State var ImageOffset:CGFloat = 0
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(spacing: 0){
                HStack(alignment: .top){
                    Button(action: {
                        Present = false
                    }){
                        Image(systemName: "xmark")
                    }.padding([.top, .leading], defaultPadding * 2)
                        .foregroundColor(Color.black)
                }.frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
                    .background(Color.white)
                ScrollView(){
                    VStack(spacing: 0){
                        ReasonView()
                    }.background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                                               value: -$0.frame(in: .named("scroll")).origin.y)
                    })
                    ZStack{
                        Image("BGImage").offset(y: ImageOffset)
                        VStack(){
                            Description(DescInfo: TextData).frame(width: UIScreen.main.bounds.width * 0.82, alignment: .center)
                        }
                    }.offset(y: -10)
                }.onPreferenceChange(ViewOffsetKey.self) {
                    if $0 < UIScreen.main.bounds.height * 0.75 {
                        ImageOffset =  0 + UIScreen.main.bounds.height * 0.75 - $0
                    }else if $0 > UIScreen.main.bounds.height * 0.75  && $0 < 800{
                        ImageOffset = 0 - UIScreen.main.bounds.height * 0.75 + $0
                    }
                }
            }
            Text("공유하기").foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.size.width * 0.8, height: 50, alignment: .center)
                .background(Color.blue).cornerRadius(defaultCornerRadious)
                .offset(y: UIScreen.main.bounds.height/2 - 90)
        }
    }
}




struct ReasonView: View {
    var body: some View{
        ZStack{
            Color.white
            VStack{
                Image("Logo").resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                Text("토스가")
                Text("평생 무료 송금을")
                Text("시작한 이유")
            }
        }.frame(height: UIScreen.main.bounds.height * 0.75 , alignment: .center)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ReasonView()
    }
}



struct Description: View{
    @State var DescInfo:DescriptionInfo
    var body: some View{
        VStack(alignment: .leading){
            Text(DescInfo.Title).padding(.bottom, 10)
            Text(DescInfo.Content)
        }
        .frame(height: 600,alignment: .topLeading)
        .background(Color.white)
        .cornerRadius(13)
    }
}

struct DescriptionInfo {
    @State var Title:String
    @State var Content:String
}

let TextData:DescriptionInfo = DescriptionInfo(Title: "송금 수수료, 한달에 \n 얼마나 내고 계시나요?", Content: "친구들과 식사 후에 더치페이하는 것부터 \n 관리비, 공과금, 월세 자동이체까지. 우리는 \n 일상에서 생각보다 자주, 누군가에게 돈을\n 보내곤 합니다. 이때 빠지지 않는 것이 '송금\n 수수료' 인데요. 현재 시중은행 및 인터넷은행\n 18곳 중 12 곳은 타행이체 시 500원 내외의 \n 수수료를 부과하고 있습니다. 아, 물론 \n 토스에서는 월 10회까지 송금이 무료였습니다.\n 하지만 토스에서 10명 중 3명은 한달에 10번\n넘게 송금을 하고 있습니다. 이 말은 즉, 30%의\n 사용자가 매달 송금 수수료를 내고 있다는 이야기 이기도 합니다.")
