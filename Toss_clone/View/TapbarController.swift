//
//  TapbarController.swift
//  Toss_clone
//
//  Created by 김수환 on 2022/08/03.
//

import SwiftUI
let TabBarList = [TabBarPage(page: MainView(), icon: "house",iconTapped:"house.fill", content: "홈", tag: "house"),
                  TabBarPage(page: LaunchScreenView(), icon: "suit.diamond",iconTapped:"suit.diamond.fill", content: "혜택", tag: "dia"),
                  TabBarPage(page: SendView(), icon: "wonsign.circle",iconTapped:"wonsign.circle.fill", content: "송금", tag: "send"),
                  TabBarPage(page: LaunchScreenView(), icon: "chart.bar.fill",iconTapped:"chart.bar.fill", content: "주식", tag: "stock"),
                  TabBarPage(page: LaunchScreenView(), icon: "line.3.horizontal",iconTapped:"line.3.horizontal", content: "전체", tag: "all")]

struct TabBarPage: Identifiable {
    let id = UUID()
    let page: Any
    let icon: String
    let iconTapped: String
    let content:String
    let tag: String
}
