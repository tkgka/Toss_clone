import SwiftUI
struct TabBar: View {
    @ObservedObject var ObserbData = ObsbData
    var body: some View {
        HStack{
            ForEach(TabBarList) { item in
                Spacer()
                Button(action: {
                    ObserbData.selectedTab = item.tag
                }){
                    VStack {
                        Image(systemName: ObserbData.selectedTab == item.tag ? item.iconTapped : item.icon)
                            .imageScale(.large)
                        Text(item.content).font(.system(size: 10, weight: .light)).foregroundColor(Color("FontColor"))
                    }.frame(height: 70)
                        .padding(.bottom, 25)
                        .foregroundColor(ObserbData.selectedTab == item.tag ? Color("BlackNWhiteColor") : Color.gray)
                }
                Spacer()
            }
        }
        .background(Color("CellColor"))
        .cornerRadius(25, corners: [.topLeft, .topRight])
        .overlay(
            ObserbData.LazyViewIsEnd == true ?
            (RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray, lineWidth: 0.1)) : nil
        )
        .offset(y:UIScreen.main.bounds.size.height/2 - cellHeight)
    }
}
