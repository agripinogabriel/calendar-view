import Foundation

extension DateComponents {
    var weekdayName: String? {
        switch weekday {
        case 2:
            return "Segunda"
        case 3:
            return "Terça"
        case 4:
            return "Quarta"
        case 5:
            return "Quinta"
        case 6:
            return "Sexta"
        case 7:
            return "Sábado"
        case 1:
            return "Domingo"
        default:
            return nil
        }
    }
    
    var monthName: String? {
        switch month {
        case 1:
            return "Janeiro"
        case 2:
            return "Fevereiro"
        case 3:
            return "Março"
        case 4:
            return "Abril"
        case 5:
            return "Maio"
        case 6:
            return "Junho"
        case 7:
            return "Julho"
        case 8:
            return "Agosto"
        case 9:
            return "Setembro"
        case 10:
            return "Outrubro"
        case 11:
            return "Novembro"
        case 12:
            return "Dezembro"
        default:
            return nil
        }
    }
}
