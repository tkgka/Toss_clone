//
//  GroupView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/06.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        VStack{
            HStack{
                Text("모임").font(.system(size: 20, weight: .black)).foregroundColor(Color("FontColor"))
                    .padding()
                Spacer()
            }
            HStack{
                Image(systemName: "person.2.fill")
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .padding(.leading , 20)
                VStack(spacing: 2){
                    HStack{
                        Text("개미").font(.footnote).foregroundColor(Color.gray)
                        Spacer()
                    }
                    HStack{
                        Text("\(0)원").font(.headline).foregroundColor(Color("FontColor"))
                        Spacer()
                    }
                }
            }.padding([.bottom], defaultPadding)
            
        }.frame(width: UIScreen.main.bounds.size.width - cellPadding, alignment: .leading)
            .foregroundColor(.black)
            .background(Color("CellColor"))
            .cornerRadius(defaultCornerRadious)
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
