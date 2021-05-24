import SwiftUI

struct WeekView: View {
    static private let DAYS_IN_WEEK = 7
    
    @State var currentDate = Date()
    
    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width / CGFloat(WeekView.DAYS_IN_WEEK)
            
            HStack(spacing: 0) {
                ForEach(0..<WeekView.DAYS_IN_WEEK) { index in
                    VStack(spacing: 0) {
                        let date = Calendar.current.date(byAdding: .day, value: index, to: currentDate)!
                        textView(date.weekDayName)
                        numberView(date.day)
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
        Text(text)
            .foregroundColor(.blue)
            .font(
                .system(
                    size: 12,
                    weight: .regular,
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
