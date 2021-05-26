import SwiftUI

struct MonthView: View {
    
    @Binding var date: Date
    
    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width / CGFloat(CalendarView.DAYS_IN_WEEK)
            
            VStack {
                HStack(spacing: 0) {
                    ForEach(0..<CalendarView.DAYS_IN_WEEK) { index in
                        let day = Calendar.current.date(byAdding: .day, value: index, to: date.fisrtDayOnWeek)!
                        textView(day.weekDayName)
                            .frame(width: itemWidth, alignment: .center)
                    }
                }
                ForEach(0..<6) { weekOfMonth in
                    VStack {
                        HStack(spacing: 0) {
                            ForEach(0..<7) { dayOfMonth in
                                let day = dateFor(weekOfMonth: weekOfMonth, dayOfMonth: dayOfMonth)
                                let isSelected = Calendar.current.isDate(day, inSameDayAs: date)
                                let opacity = opacity(for: day, selected: isSelected)
                                let color = isSelected ? Color(.darkGray) : Color(.lightGray)
                                numberView(day.day, color: color, opacity: opacity)
                                    .frame(width: itemWidth, alignment: .center)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func dateFor(weekOfMonth: Int, dayOfMonth: Int) -> Date {
        let firstDayOnMonth = date.firstDayOnMonth
        let fisrtDayOnWeek = firstDayOnMonth.fisrtDayOnWeek
        let factor = (weekOfMonth * 7) + dayOfMonth
        return Calendar.current.date(byAdding: .day, value: factor, to: fisrtDayOnWeek)!
    }
    
    private func opacity(for date: Date, selected: Bool) -> Double {
        guard !selected else { return 1.0 }
        guard date.isSameMonth(of: self.date) else { return 0.3 }
        guard date.isWeekend else { return 1.0 }
        return 0.7
    }
    
    private func numberView(_ num: Int, color: Color, opacity: Double) -> some View {
        Text("\(num)")
            .font(.system(size: 22, weight: .black, design: .rounded))
            .foregroundColor(color)
            .lineLimit(1)
            .opacity(opacity)
    }
    
    private func textView(_ text: String) -> some View {
        Text(text)
            .foregroundColor(.blue)
            .font(.system( size: 12, design: .rounded))
            .lineLimit(1)
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView(
            date: Binding<Date>(
                get: { Date() },
                set: { (date) in }
            )
        )
    }
}
