import Foundation

extension Date {
    var day: Int {
        let dateComponents = Calendar.current.dateComponents([.day], from: self)
        return dateComponents.day!
    }
    
    var month: Int {
        let dateComponents = Calendar.current.dateComponents([.month], from: self)
        return dateComponents.month!
    }
    
    var year: Int {
        let dateComponents = Calendar.current.dateComponents([.year], from: self)
        return dateComponents.year!
    }
    
    var weekDayName: String {
        let dateComponents = Calendar.current.dateComponents([.weekday], from: self)
        return dateComponents.weekdayName!
    }
    
    var monthName: String {
        let dateComponents = Calendar.current.dateComponents([.month], from: self)
        return dateComponents.monthName!
    }
    
    var isWeekend: Bool {
        let dateComponents = Calendar.current.dateComponents([.weekday], from: self)
        return dateComponents.weekday == 1 || dateComponents.weekday == 7
    }
    
    var isInCurrentMonth: Bool {
        let dateComponents = Calendar.current.dateComponents([.month], from: self)
        return dateComponents.month == Date.currentMonth
    }
    
    func isSameMonth(of date: Date) -> Bool {
        return self.month == date.month
    }
    
    static var currentMonth: Int {
        let dateComponents = Calendar.current.dateComponents([.month], from: Date())
        return dateComponents.month!
    }
}
