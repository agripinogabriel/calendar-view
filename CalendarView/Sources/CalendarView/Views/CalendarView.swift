import SwiftUI

public struct CalendarView: View {
    
    @State private var date: Date = Date()
    var onDateChanged: (Date) -> Void =  { _ in }
    
    public init(date: Date = Date(), onDateChanged: @escaping (Date) -> Void) {
        self.date = date
        self.onDateChanged = onDateChanged
    }
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationControlView {
                    date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
                    onDateChanged(date)
                } onBackward: {
                    date = Calendar.current.date(byAdding: .day, value: -1, to: date)!
                    onDateChanged(date)
                } onCurrentDate: {
                    date = Date()
                    onDateChanged(date)
                }
            }
            WeekView()
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
