import SwiftUI

struct NavigationControlView: View {
    
    @Binding var date: Date
    var style: CalendarStyle
    
    var body: some View {
        HStack(spacing: 2) {
            Button { moveBackward() }
                label: { Image(systemName: "chevron.backward") }
                .buttonStyle(GrowingButton())
            
            Button { date = Date() }
                label: {
                    Text("Today".localized)
                        .font(.system(size: 14))
                }
                .buttonStyle(GrowingButton())
            
            Button { moveForward() }
                label: { Image(systemName: "chevron.forward") }
                .buttonStyle(GrowingButton())
        }
    }
    
    private func moveForward() {
        
        switch style {
        case .day:
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        case .week:
            moveWeekForward()
        case .month:
            moveMonthForward()
        }
    }
    
    private func moveWeekForward() {
        let fisrtDayOnWeek = date.fisrtDayOnWeek
        date = Calendar.current.date(byAdding: .day, value: 7, to: fisrtDayOnWeek)!
    }
    
    private func moveMonthForward() {
        let firstDayOfMonth = date.firstDayOnMonth
        date = Calendar.current.date(byAdding: .month, value: 1, to: firstDayOfMonth)!
    }
    
    private func moveBackward() {
        
        switch style {
        case .day:
            date = Calendar.current.date(byAdding: .day, value: -1, to: date)!
        case .week:
            moveWeekBackward()
        case .month:
            moveMonthBackward()
        }
    }
    
    private func moveWeekBackward() {
        let fisrtDayOnWeek = date.fisrtDayOnWeek
        date = Calendar.current.date(byAdding: .day, value: -1, to: fisrtDayOnWeek)!
    }
    
    private func moveMonthBackward() {
        let firstDayOfMonth = date.firstDayOnMonth
        date = Calendar.current.date(byAdding: .month, value: -1, to: firstDayOfMonth)!
    }
}

struct NavigationControlView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationControlView(
            date: Binding<Date>(
                get: {
                    return Date()
                },
                set: { (date) in
                    
                }
            ),
            style: .week
        )
    }
}
