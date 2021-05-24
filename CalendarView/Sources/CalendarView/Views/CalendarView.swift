import SwiftUI

public struct CalendarView: View {
    
    @State private var date = Date()
    
    public init() {}
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationControlView {
                    date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
                } onBackward: {
                    date = Calendar.current.date(byAdding: .day, value: -1, to: date)!
                } onCurrentDate: {
                    date = Date()
                }
            }
            DayView(date: $date)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
