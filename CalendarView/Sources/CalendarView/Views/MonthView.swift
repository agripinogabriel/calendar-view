import SwiftUI

struct MonthView: View {
    
    @Binding var date: Date
    
    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width / CGFloat(CalendarView.DAYS_IN_WEEK)
            
            VStack {
            }
        }
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
