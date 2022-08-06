//
//  SpendView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/03.
//

import SwiftUI

struct SpendTopView: View {
    @ObservedObject var ObserbData = ObsbData
    var body: some View {
        VStack{
            HStack{
                Text("소비").font(.system(size: 20, weight: .black)).foregroundColor(Color("FontColor"))
                    .padding()
                Spacer()
            }
            ZStack{
                if ObserbData.LazyViewIsEnd == true{
                    HStack{
                        Image("Logo")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .padding(.leading , 20)
                        VStack(spacing: 2){
                            HStack{
                                Text("이번 달 쓴 금액").font(.footnote).foregroundColor(Color.gray)
                                Spacer()
                            }
                            HStack{
                                Text("사용 금액 보기").font(.headline).foregroundColor(Color("FontColor"))
                                Spacer()
                            }
                        }
                    }.padding([.vertical], defaultPadding)
                }
                NavigationLink( destination: LaunchScreenView().navigationBarHidden(true))
                {
                    Text("내역").foregroundColor(Color("FontColor"))
                        .font(.system(size: 15))
                        .padding([.horizontal], 15)
                        .padding([.vertical], defaultPadding)
                }.background(Color("BtnColor"))
                    .cornerRadius(5)
                    .padding(.trailing, 20)
                    .frame(alignment: .center)
                    .offset(x: UIScreen.main.bounds.size.width/2.7, y: ObserbData.LazyViewIsEnd == false ? -50.0 : 0)
            }
            Divider().frame(width:UIScreen.main.bounds.size.width - cellPadding, height:  ObserbData.LazyViewIsEnd == false ? 25 : nil, alignment: .top)
                .offset(y: ObserbData.LazyViewIsEnd == false ? -50.0 : 0)
            
        }.frame(width: ObserbData.LazyViewIsEnd == false ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.width - cellPadding, alignment: .leading)
            .foregroundColor(.black)
            .background(Color("CellColor"))
            .cornerRadius(defaultCornerRadious, corners: [.topLeft, .topRight])
            .overlay(
                ObserbData.LazyViewIsEnd == false ?
                (RoundedRectangle(cornerRadius: defaultCornerRadious)
                    .stroke(Color.gray, lineWidth: 0.1)) : nil
            )
    }
}

struct SpendBottomView:View {
    @ObservedObject var ObserbData = ObsbData
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Text("D-15")
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color.gray)
                        .cornerRadius(defaultCornerRadious)
                        .padding(.leading , 20)
                    VStack(spacing: 2){
                        HStack{
                            Text("X월 xx일 낼 카드값").font(.footnote).foregroundColor(Color.gray)
                            Spacer()
                        }
                        HStack{
                            Text("\(1000000) 원").font(.headline).foregroundColor(Color("FontColor"))
                            Spacer()
                        }
                    }
                }.padding([.vertical], defaultPadding * 3)
                
            }
        }.frame(width: ObserbData.LazyViewIsEnd == false ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.width - cellPadding, alignment: .leading)
            .foregroundColor(.black)
            .background(Color("CellColor"))
            .cornerRadius(defaultCornerRadious, corners: [.bottomLeft, .bottomRight])
    }
}





struct SpendView_Previews: PreviewProvider {
    static var previews: some View {
        SpendTopView()
    }
}




