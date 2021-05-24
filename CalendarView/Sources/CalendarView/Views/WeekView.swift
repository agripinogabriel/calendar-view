import SwiftUI

struct WeekView: View {
    
    static let ITEM_MIN_WIDHT = CGFloat(80)
    static let MAX_ITEMS_PER_SCREEN = 7
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        GeometryReader { geometry in
            let maxItemsPerScreen = Int(geometry.size.width / WeekView.ITEM_MIN_WIDHT)
            let itemsPerScreen = min(maxItemsPerScreen, WeekView.MAX_ITEMS_PER_SCREEN)
            let itemWidth = geometry.size.width / CGFloat(itemsPerScreen)
             
            HStack(spacing: 0){
                ForEach(0..<itemsPerScreen) { index in
                    VStack(spacing: 0) {
                        let date = Calendar.current.date(byAdding: .day, value: index, to: currentDate)!
                        textView(date.weekDayName)
                        numberView(date.day)
                        textView(date.monthName)
                    }
                    .frame(width: itemWidth, alignment: .center)
                }
            }
        }
    }
    
    private func numberView(_ num: Int) -> some View {
        Text("\(num)")
            .font(
                .system(
                    size: 25,
                    weight: .black,
                    design: .rounded
                )
            )
            .foregroundColor(Color(.lightGray))
            .lineLimit(1)
    }
    
    private func textView(_ text: String) -> some View {
        return Text(text)
            .foregroundColor(.blue)
            .font(
                .system(
                    size: 12,
                    weight: .black,
                    design: .rounded
                )
            )
            .lineLimit(1)
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
