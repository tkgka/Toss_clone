//
//  Description.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/07.
//

import SwiftUI

struct DescriptionView: View {
    @Binding var Present:Bool
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    Present = false
                }){
                    Image(systemName: "xmark")
                }.padding([.top, .leading], defaultPadding * 2)
                    .foregroundColor(Color.black)
                Spacer()
            }
            ScrollView{
                
            }
        }
        
    }
}


