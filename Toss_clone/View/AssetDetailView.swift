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
                VStack{
                    Text(Bank)
                    Text("\(Amount) 원").font(.headline)
                }
            }.toolbar{
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

//struct AssetDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AssetDetailView()
//    }
//}
