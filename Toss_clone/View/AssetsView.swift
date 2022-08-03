//
//  AssetsView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI


let AssetsValue = [AssetStruct(AssetName: "토스뱅크 통장", AssetImage: UIImage(named: "Logo")!, Amount: 71320, Goto: "1"),
                   AssetStruct(AssetName: "또 토스뱅크 통장", AssetImage: UIImage(named: "Logo")!, Amount: 100000, Goto: "2"),
                   AssetStruct(AssetName: "또 토스뱅크 통장", AssetImage: UIImage(named: "Logo")!, Amount: 100000, Goto: "2"),
                   AssetStruct(AssetName: "또 토스뱅크 통장", AssetImage: UIImage(named: "Logo")!, Amount: 100000, Goto: "2"),
                   AssetStruct(AssetName: "또 토스뱅크 통장", AssetImage: UIImage(named: "Logo")!, Amount: 100000, Goto: "2"),
                   AssetStruct(AssetName: "또 토스뱅크 통장", AssetImage: UIImage(named: "Logo")!, Amount: 100000, Goto: "2"),
                   AssetStruct(AssetName: "또 토스뱅크 통장", AssetImage: UIImage(named: "Logo")!, Amount: 100000, Goto: "2")]




struct AssetStruct:Hashable {
    let AssetName:String
    let AssetImage:UIImage
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
                            Image(uiImage: asset.AssetImage)
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .topTrailing)
                                .background(Color.blue)
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
                    
                    Button(action: {
                        print(asset.Goto)
                    }) {
                        Text("송금")
                            .font(.system(size: 15))
                            .padding([.trailing, .leading], 15)
                            .padding([.top, .bottom], 10)
                    }
                    .background(Color("BackgroundColor"))
                    .cornerRadius(5)
                    .padding(.trailing, 20)
                    .frame(alignment: .center)
                    .offset(x: UIScreen.main.bounds.size.width/2.7, y: -10)
                }
                
            }
            
            
            
        }.frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
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
