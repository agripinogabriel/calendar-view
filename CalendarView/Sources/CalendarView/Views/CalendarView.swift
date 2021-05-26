import SwiftUI

public struct CalendarView: View {
    
    static let DAYS_IN_WEEK = 7
    
    @State var date = Date()
    @State var style = CalendarStyle.week
    var onDateChanged: (Date) -> Void =  { _ in }
    
    public init(date: Date = Date(), style: CalendarStyle = CalendarStyle.week, onDateChanged: @escaping (Date) -> Void) {
        self._date = State(initialValue: date)
        self._style = State(initialValue: style)
        self.onDateChanged = onDateChanged
    }
    
    public var body: some View {
        VStack {
            HStack {
                if style != .day {
                    let date = style == .week ? date.fisrtDayOnWeek : date.firstDayOnMonth
                    CalendarHeaderView(date: date)
                }
                Spacer()
                NavigationControlView(date: $date, style: style)
            }
            switch style {
            case .day:
                DayView(date: $date)
            case .week:
                WeekView(date: $date)
            case .month:
                MonthView(date: $date)
            }
        }
        .onDataChange(of: date) { value in
            onDateChanged(value)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {        
        VStack {
            CalendarView(style: .day) { _ in }
            CalendarView(style: .week) { _ in }
            CalendarView(style: .month) { _ in }
            Spacer()
        }
    }
}
