import SwiftUI

public struct CalendarView: View {
    
    @State private var date: Date = Date()
    
    var style: CalendarStyle = .week
    var onDateChanged: (Date) -> Void =  { _ in }
    
    public init(date: Date = Date(), style: CalendarStyle = CalendarStyle.week, onDateChanged: @escaping (Date) -> Void) {
        self.date = date
        self.style = style
        self.onDateChanged = onDateChanged
    }
    
    public var body: some View {
        VStack {
            HStack {
                if style != .day {
                    CalendarHeaderView(date: date)
                }
                Spacer()
                NavigationControlView(date: $date)
            }
            switch style {
            case .day:
                DayView(date: $date)
            case .week:
                WeekView(date: $date)
            case .month:
                Text("Not yet implemented!")
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
