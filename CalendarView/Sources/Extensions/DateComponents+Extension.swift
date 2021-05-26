import Foundation

extension DateComponents {
    var weekdayName: String? {
        switch weekday {
        case 2:
            return "Monday".localized
        case 3:
            return "Tursday".localized
        case 4:
            return "Wednesday".localized
        case 5:
            return "Thursday".localized
        case 6:
            return "Friday".localized
        case 7:
            return "Saturday".localized
        case 1:
            return "Sunday".localized
        default:
            return nil
        }
    }
    
    var monthName: String? {
        switch month {
        case 1:
            return "January".localized
        case 2:
            return "February".localized
        case 3:
            return "March".localized
        case 4:
            return "April".localized
        case 5:
            return "May".localized
        case 6:
            return "June".localized
        case 7:
            return "July".localized
        case 8:
            return "August".localized
        case 9:
            return "September".localized
        case 10:
            return "October".localized
        case 11:
            return "November".localized
        case 12:
            return "December".localized
        default:
            return nil
        }
    }
}
