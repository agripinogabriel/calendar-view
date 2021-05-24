import SwiftUI

struct WeekView: View {
    static private let DAYS_IN_WEEK = 7
    
    @Binding var date: Date
    @State private var totalHeight = CGFloat(100)
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let itemWidth = geometry.size.width / CGFloat(WeekView.DAYS_IN_WEEK)
                
                HStack(spacing: 0) {
                    ForEach(0..<WeekView.DAYS_IN_WEEK) { index in
                        VStack(spacing: 0) {
                            let date = Calendar.current.date(byAdding: .day, value: index, to: date)!
                            textView(date.weekDayName)
                                .opacity(opacity(for: date))
                            numberView(date.day)
                                .opacity(opacity(for: date))
                        }
                        .frame(width: itemWidth, alignment: .center)
                        .background(GeometryReader { gp -> Color in
                            DispatchQueue.main.async {
                                self.totalHeight = gp.size.height
                            }
                            return Color.clear
                        })
                    }
                }
            }
        }
        .frame(height: totalHeight)
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
    
    private func opacity(for date: Date) -> Double {
        guard date.isInCurrentMonth else { return 0.3 }
        guard date.isWeekend else { return 1.0 }
        return 0.7
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(date: Binding<Date>(get: {
            return Date()
        }, set: { (date) in
            
        }))
    }
}
