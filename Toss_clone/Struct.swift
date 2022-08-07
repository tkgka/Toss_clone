//
//  Struct.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/04.
//

import Foundation
import SwiftUI

struct AssetStruct:Hashable {
    let AssetName:String
    let AssetImage:UIImage?
    let BGColor:Color?
    let Amount:Int
    let Goto:String
}

struct HorizentalViewStruct:Identifiable {
    let id = UUID()
    let Title:String
    let Content:String
    let CellImage:UIImage?
    let Goto:AnyView
}

struct CellStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.frame(width: configuration.isPressed ? UIScreen.main.bounds.size.width * 0.88 : UIScreen.main.bounds.size.width - cellPadding, height: cellHeight).background(configuration.isPressed ? Color.gray.opacity(0.3) : Color("CellColor"))
    }
}


struct ListStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.frame(width: UIScreen.main.bounds.size.width - cellPadding, height: 50).background(configuration.isPressed ? Color.gray.opacity(0.3) : Color("CellColor"))
    }
}

struct TossBankStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.frame(width: UIScreen.main.bounds.size.width - cellPadding, height: cellHeight).background(configuration.isPressed ? Color.gray.opacity(0.3) : Color("CellColor"))
    }
}
