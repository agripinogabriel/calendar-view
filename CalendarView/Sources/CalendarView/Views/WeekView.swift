import SwiftUI

struct WeekView: View {
    static private let DAYS_IN_WEEK = 7
    
    @Binding var date: Date
    @State private var totalHeight = CGFloat(100)
    
    private var fisrtDayOnView: Date {
        let dateComponents = Calendar.current.dateComponents([.weekday], from: date)
        let distanceFromMonday = -1 * ((dateComponents.weekday! + 5) % 7)
        return Calendar.current.date(byAdding: .day, value: distanceFromMonday, to: date)!
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let itemWidth = geometry.size.width / CGFloat(WeekView.DAYS_IN_WEEK)
                
                VStack {
                    HStack(spacing: 0) {
                        textView("Monday".localized)
                            .frame(width: itemWidth, alignment: .center)
                        textView("Tursday".localized)
                            .frame(width: itemWidth, alignment: .center)
                        textView("Wednesday".localized)
                            .frame(width: itemWidth, alignment: .center)
                        textView("Thursday".localized)
                            .frame(width: itemWidth, alignment: .center)
                        textView("Friday".localized)
                            .frame(width: itemWidth, alignment: .center)
                        textView("Saturday".localized)
                            .frame(width: itemWidth, alignment: .center)
                        textView("Sunday".localized)
                            .frame(width: itemWidth, alignment: .center)
                    }
                    HStack(spacing: 0) {
                        ForEach(0..<WeekView.DAYS_IN_WEEK) { index in
                            let day = Calendar.current.date(byAdding: .day, value: index, to: fisrtDayOnView)!
                            let isSelected = Calendar.current.isDate(day, inSameDayAs: date)
                            let opacity = opacity(for: day, selected: isSelected)
                            let color = isSelected ? Color(.darkGray) : Color(.lightGray)
                            numberView(day.day, color: color, opacity: opacity)
                        }
                        .frame(width: itemWidth, alignment: .center)
                        .background(
                            GeometryReader { gp -> Color in
                                DispatchQueue.main.async {
                                    self.totalHeight = gp.size.height
                                }
                                return Color.clear
                            }
                        )
                    }
                }
            }
        }
        .frame(height: totalHeight)
    }
    
    private func numberView(_ num: Int, color: Color, opacity: Double) -> some View {
        Text("\(num)")
            .font(
                .system(
                    size: 25,
                    weight: .black,
                    design: .rounded
                )
            )
            .foregroundColor(color)
            .lineLimit(1)
            .opacity(opacity)
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
    
    private func opacity(for date: Date, selected: Bool) -> Double {
        guard !selected else { return 1.0 }
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
