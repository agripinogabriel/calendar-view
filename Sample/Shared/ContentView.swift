import SwiftUI
import CalendarView

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            CalendarView (date: Calendar.dayFirstSunshine, style: .day) { date in
                Logger.logInfo(formatDate(date), scope: "CalendarViewSample")
            }
            .padding()
            CalendarView (date: Calendar.dayFirstSunshine, style: .week) { date in
                Logger.logInfo(formatDate(date), scope: "CalendarViewSample")
            }
            .padding()
            Spacer()
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Calendar {
    static var dayFirstSunshine: Date {
        let dateComponents = DateComponents.init(year: 1987, month: 12, day: 21)
        let dayFirstSunshine = Calendar.current.date(from: dateComponents)!
        return dayFirstSunshine
    }
}
