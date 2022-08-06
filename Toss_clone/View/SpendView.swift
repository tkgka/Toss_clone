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
            if ObserbData.LazyViewIsEnd == true{
                Text("!@#")
                Text("!@#")
                Text("!@#")
                Text("!@#")
            }
            Divider().frame(width:UIScreen.main.bounds.size.width - cellPadding, height:  ObserbData.LazyViewIsEnd == false ? 55 : nil, alignment: .top)
            
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
                Text("소비").font(.system(size: 20, weight: .black)).foregroundColor(Color("FontColor"))
                    .padding()
                Spacer()
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




