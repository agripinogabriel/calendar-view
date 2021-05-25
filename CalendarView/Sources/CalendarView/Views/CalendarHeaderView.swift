import SwiftUI

struct CalendarHeaderView: View {
    
    let date: Date
    
    var body: some View {
        let monthName = date.fisrtDayOnWeek.monthName
        let year = date.fisrtDayOnWeek.year
        Text("\(monthName), \(String(year))")
            .font(
                .system(
                    size: 16,
                    weight: .black,
                    design: .rounded
                )
            )
            .foregroundColor(.blue)
            .lineLimit(1)
    }
}


struct CalendarHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalendarHeaderView(date: Date()) 
        }
    }
}
