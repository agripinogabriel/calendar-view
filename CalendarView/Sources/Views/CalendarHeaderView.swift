import SwiftUI

struct CalendarHeaderView: View {
    let date: Date
    
    var body: some View {
        Text("\(date.monthName), \(String(date.year))")
            .font(.system( size: 16, weight: .black, design: .rounded))
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
