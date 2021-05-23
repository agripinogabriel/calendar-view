import SwiftUI

import SwiftUI

public struct CalendarView: View {
    
    public init() {}
    
    public var body: some View {
        DayView()
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
