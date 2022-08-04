//
//  Assets.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/03.
//

import Foundation


class ObserveData:ObservableObject {
    @Published var  LazyViewIsEnd = false
}

let ObsbData = ObserveData()
