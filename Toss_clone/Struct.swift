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
