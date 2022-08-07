//
//  CardView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI

struct TossBankView: View {
    var body: some View {
        NavigationLink( destination: LaunchScreenView().navigationBarHidden(true)){
            HStack{
                Text("토스뱅크").font(.system(size: 20, weight: .black)).foregroundColor(Color("FontColor"))
                    .padding()
                Spacer()
                Image(systemName: "chevron.right").foregroundColor(Color("FontColor"))
                    .padding(.trailing, 20)
                
            }
            .foregroundColor(.black)
            
        }
        .background(Color("CellColor"))
        .cornerRadius(defaultCornerRadious)
        .buttonStyle(TossBankStyle())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        TossBankView()
    }
}
