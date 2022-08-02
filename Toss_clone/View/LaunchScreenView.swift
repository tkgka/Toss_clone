//
//  LaunchScreenView.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/01.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color.white.ignoresSafeArea()
            Image("Logo").resizable().frame(width: 200, height: 200, alignment: .center)
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}

