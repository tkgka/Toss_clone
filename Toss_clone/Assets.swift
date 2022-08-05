//
//  Assets.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/03.
//

import Foundation
import SwiftUI

class ObserveData:ObservableObject {
    @Published var  LazyViewIsEnd = false
}

let ObsbData = ObserveData()


let AssetsValue = [AssetStruct(AssetName: "토스뱅크 통장", AssetImage: UIImage(named: "Logo"), BGColor: Color.blue, Amount: 71320, Goto: "1"),
                   AssetStruct(AssetName: "신협 은행 통장", AssetImage: UIImage(named: "SH"), BGColor: nil, Amount: 100000, Goto: "2"),
                   AssetStruct(AssetName: "농협 은행 통장", AssetImage: UIImage(named: "NH"), BGColor: nil, Amount: 200000, Goto: "3"),
                   AssetStruct(AssetName: "IBK 기업은행 통장", AssetImage: UIImage(named: "IBK"), BGColor: nil, Amount: 300000, Goto: "4"),
                   AssetStruct(AssetName: "우리 은행 통장", AssetImage: UIImage(named: "Uri"), BGColor: nil, Amount: 400000, Goto: "5"),
                   AssetStruct(AssetName: "하나 은행 통장", AssetImage: UIImage(named: "Hana"), BGColor: nil, Amount: 500000, Goto: "6"),
                   AssetStruct(AssetName: "KB 국민 은행 통장", AssetImage: UIImage(named: "KB"), BGColor: Color.gray, Amount: 700000, Goto: "7")]


let cellPadding:CGFloat = 30
let defaultCornerRadious:CGFloat = 16


struct ListSelectionStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color.gray.opacity(0.3) : Color.clear)
    }
}
