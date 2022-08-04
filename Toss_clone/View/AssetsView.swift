//
//  AssetsView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI


let AssetsValue = [AssetStruct(AssetName: "토스뱅크 통장", AssetImage: UIImage(named: "Logo"), BGColor: Color.blue, Amount: 71320, Goto: "1"),
                   AssetStruct(AssetName: "신협 은행 통장", AssetImage: UIImage(named: "SH"), BGColor: nil, Amount: 100000, Goto: "2"),
                   AssetStruct(AssetName: "농협 은행 통장", AssetImage: UIImage(named: "NH"), BGColor: nil, Amount: 200000, Goto: "3"),
                   AssetStruct(AssetName: "IBK 기업은행 통장", AssetImage: UIImage(named: "IBK"), BGColor: nil, Amount: 300000, Goto: "4"),
                   AssetStruct(AssetName: "우리 은행 통장", AssetImage: UIImage(named: "Uri"), BGColor: nil, Amount: 400000, Goto: "5"),
                   AssetStruct(AssetName: "하나 은행 통장", AssetImage: UIImage(named: "Hana"), BGColor: nil, Amount: 500000, Goto: "6"),
                   AssetStruct(AssetName: "KB 국민 은행 통장", AssetImage: UIImage(named: "KB"), BGColor: Color.gray, Amount: 700000, Goto: "7")]




struct AssetStruct:Hashable {
    let AssetName:String
    let AssetImage:UIImage?
    let BGColor:Color?
    let Amount:Int
    let Goto:String
}


struct AssetsView: View {
    @State var Assests:[AssetStruct] = AssetsValue
    var body: some View {
        VStack(spacing: 5){
            HStack{
                Text("자산").font(.system(size: 20, weight: .black))
                    .padding()
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing, 20)
            }
            
            ForEach(Assests, id: \.self) { asset in
                ZStack{
                    Button(action: {
                        print("\(asset.AssetName) AAA")
                    }){
                        HStack{
                            Image(uiImage: asset.AssetImage ?? UIImage(named: "Logo")!)
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .topTrailing)
                                .background(asset.BGColor != nil ? asset.BGColor! : Color.white)
                                .clipShape(Circle())
                                .padding(.leading , 20)
                            VStack(spacing: 2){
                                HStack{
                                    Text(asset.AssetName).font(.footnote).foregroundColor(Color.gray)
                                    Spacer()
                                }
                                HStack{
                                    Text("\(asset.Amount) 원").font(.headline)
                                    Spacer()
                                }
                            }
                        }.padding(.bottom, 20)
                    }
                    
                    NavigationLink( destination: SendView(bank: asset.AssetName).navigationBarHidden(true))
                    {
                        Text("송금")
                            .font(.system(size: 15))
                            .padding([.horizontal], 15)
                            .padding([.vertical], 10)
                    }.background(Color("BackgroundColor"))
                        .cornerRadius(5)
                        .padding(.trailing, 20)
                        .frame(alignment: .center)
                        .offset(x: UIScreen.main.bounds.size.width/2.7, y: -10)
                }
                
            }
            
            
            
        }.frame(width: UIScreen.main.bounds.size.width - 30, alignment: .leading)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(16)
    }
}

struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView()
    }
}
