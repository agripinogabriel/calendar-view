import SwiftUI
import CalendarView

struct ContentView: View {
    var body: some View {
        VStack {
            CalendarView { date in
                print(formatDate(date))
            }
            Spacer()
        }
        .padding()
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
