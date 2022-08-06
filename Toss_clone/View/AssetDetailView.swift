//
//  AssetDetailView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/04.
//

import SwiftUI

struct AssetDetailView: View {
    @State var Bank:String
    @State var Amount:Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            ZStack{
                Color("BackgroundColor").ignoresSafeArea()
                ScrollView{
                    VStack(alignment: .leading){
                        Text(Bank).font(.footnote).foregroundColor(Color.gray).underline()
                        Text("\(Amount) 원").font(.title).foregroundColor(Color("FontColor"))
                            .frame(width: UIScreen.main.bounds.size.width - 50 , alignment: .leading)
                    }.padding(.bottom, 50)
                    HStack{
                        Spacer()
                        Button(action: {}){
                            Text("채우기").foregroundColor(Color.blue)
                                .frame(width: UIScreen.main.bounds.size.width/2.2, height: 50, alignment: .center).background(Color("BtnColor")).cornerRadius(defaultCornerRadious)
                        }
                        Spacer()
                        Button(action: {}){
                            Text("보내기").foregroundColor(Color.white)
                                .frame(width: UIScreen.main.bounds.size.width/2.2, height: 50, alignment: .center)
                                .background(Color.blue).cornerRadius(defaultCornerRadious)
                        }
                        Spacer()
                    }.padding(.bottom, 50)
                    
                    HStack{
                        Text("전체").foregroundColor(Color("FontColor"))
                            .padding(.leading, 25)
                        Spacer()
                        Text("불러오기 완료").foregroundColor(Color.blue)
                            .padding(.trailing, 25)
                        
                    }.padding(.bottom, 50)
                    
                    VStack{
                        Text("XXXX.x ~ XXXX.x 까지 조회했어요")
                        Button(action: {}){
                            Text("이전 내역 더보기").foregroundColor(Color.blue)
                                .frame(width: UIScreen.main.bounds.size.width/2.7, height: 45, alignment: .center).background(Color("BtnColor")).cornerRadius(defaultCornerRadious)
                        }
                    }.frame(alignment: .center)
                    
                }
            }.toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left").foregroundColor(Color("FontColor"))
                            .imageScale(.large)
                            .padding()
                    }).accentColor(.black)
                }
                ToolbarItem(placement: .principal) {
                    Text(Bank)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("관리")
                }
            }
        }
    }
}

struct AssetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AssetDetailView(Bank: "IBK", Amount: 10000)
    }
}
