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
                Text("소비").font(.system(size: 20, weight: .black))
                    .padding()
                Spacer()
            }
            if ObserbData.LazyViewIsEnd == true{
                Text("!@#")
                Text("!@#")
                Text("!@#")
                Text("!@#")
            }else {
                Divider().frame(height: 55, alignment: .top)
            }
        }.frame(width: ObserbData.LazyViewIsEnd == false ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.width - 30, alignment: .leading)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(16, corners: [.topLeft, .topRight])
            .overlay(
                ObserbData.LazyViewIsEnd == false ?
                (RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 0.1)) : nil
            )
    }
}

struct SpendBottomView:View {
    var body: some View {
        VStack{
            HStack{
                Text("소비").font(.system(size: 20, weight: .black))
                    .padding()
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.size.width - 30, alignment: .leading)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
    }
}





struct SpendView_Previews: PreviewProvider {
    static var previews: some View {
        SpendTopView()
    }
}




