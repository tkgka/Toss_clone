//
//  SendView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/04.
//

import SwiftUI

struct SendView: View {
    var bank:String?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            ZStack{
                Color("BackgroundColor").ignoresSafeArea()
                VStack{
                    Text(bank ?? "송금")
                }.frame(alignment: .center)
            } .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .padding()
                    }).accentColor(.black)
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
