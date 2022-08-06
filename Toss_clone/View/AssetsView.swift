//
//  AssetsView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI


struct AssetsView: View {
    @State var Assests:[AssetStruct] = AssetsValue
    var body: some View {
        VStack(spacing: 5){
            NavigationLink( destination: LaunchScreenView().navigationBarHidden(true)){
                HStack{
                    Text("자산").font(.system(size: 20, weight: .black)).foregroundColor(Color("FontColor"))
                        .padding()
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(Color("FontColor"))
                        .padding(.trailing, 20)
                }
            }
            .cornerRadius(defaultCornerRadious, corners: [.topLeft, .topRight])
            .buttonStyle(ListStyle())
            
            
            
            ForEach(Assests, id: \.self) { asset in
                ZStack{
                    NavigationLink( destination: AssetDetailView(Bank: asset.AssetName, Amount: asset.Amount).navigationBarHidden(true)){
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
                                    Text("\(asset.Amount) 원").font(.headline).foregroundColor(Color("FontColor"))
                                    Spacer()
                                }
                            }
                        }.padding([.vertical], defaultPadding)
                    }
                    .cornerRadius(defaultCornerRadious)
                    .buttonStyle(CellStyle())
                    NavigationLink( destination: SendView(bank: asset.AssetName).navigationBarHidden(true))
                    {
                        Text("송금").foregroundColor(Color("FontColor"))
                            .font(.system(size: 15))
                            .padding([.horizontal], 15)
                            .padding([.vertical], defaultPadding)
                    }.background(Color("BtnColor"))
                        .cornerRadius(5)
                        .padding(.trailing, 20)
                        .frame(alignment: .center)
                        .offset(x: UIScreen.main.bounds.size.width/2.7)
                }
                
            }
            
            
            
        }.frame(width: UIScreen.main.bounds.size.width - cellPadding, alignment: .leading)
            .foregroundColor(.black)
            .background(Color("CellColor"))
            .cornerRadius(defaultCornerRadious)
    }
}

struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView()
    }
}

