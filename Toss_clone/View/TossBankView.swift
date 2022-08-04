//
//  CardView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI

struct TossBankView: View {
    var body: some View {
        HStack{
            Text("토스뱅크").font(.system(size: 20, weight: .black))
            .padding()
            Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing, 20)
            
        }.frame(width: UIScreen.main.bounds.size.width - 30, alignment: .leading)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(16)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        TossBankView()
    }
}
