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
            }
        }
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
