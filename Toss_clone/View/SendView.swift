//
//  SendView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/04.
//

import SwiftUI

struct SendView: View {
    var bank:String?
    @State var AccountNumber:String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            ZStack{
                Color("BackgroundColor").ignoresSafeArea()
                VStack(){
                    Text("어디로 돈을 보낼까요?").font(.title).foregroundColor(Color("FontColor"))
                        .frame(width: UIScreen.main.bounds.size.width - 50 , alignment: .topLeading)
                        .padding([.leading ,.bottom], 30)
                    
                    ScrollView{
                        VStack{
                            Text("계좌번호 입력")
                                .frame(width: UIScreen.main.bounds.size.width - 50 , alignment: .topLeading)
                            Rectangle()
                                .frame(height: 1)
                                .padding(.leading, 16)
                                .padding(.trailing, 16)
                        }.foregroundColor(.gray)
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        if bank != nil {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "chevron.left").foregroundColor(Color("FontColor"))
                                    .imageScale(.large)
                                    .padding()
                            }).accentColor(.black)
                        }
                    }
                }.navigationBarTitleDisplayMode(.inline)
                if bank == nil {
                    TabBar()
                }
            }
        }
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
