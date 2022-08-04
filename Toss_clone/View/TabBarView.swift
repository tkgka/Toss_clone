import SwiftUI
struct TabBar: View {
    @ObservedObject var ObserbData = ObsbData
    @Binding var selectedTab: String
    var body: some View {
        return HStack{
            ForEach(TabBarList) { item in
                Spacer()
                Button(action: {
                    selectedTab = item.tag
                }){
                    VStack {
                        Image(systemName: selectedTab == item.tag ? item.iconTapped : item.icon)
                            .imageScale(.large)
                        Text(item.content).font(.system(size: 10, weight: .light))
                    }.frame(height: 70)
                        .padding(.bottom, 25)
                        .foregroundColor(selectedTab == item.tag ? Color.black : Color.gray)
                }
                Spacer()
            }
        }
        .background(Color.white)
        .cornerRadius(25, corners: [.topLeft, .topRight])
        .overlay(
            ObserbData.LazyViewIsEnd == true ?
            (RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray, lineWidth: 0.1)) : nil
        )
        .offset(y:UIScreen.main.bounds.size.height/2 - 40)
    }
}
