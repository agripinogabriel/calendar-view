import XCTest
import Quick
import Nimble

@testable import CalendarView

class DateExtensionTests: QuickSpec {
    override func spec() {
        describe("DateExtensitonTests") {
            
            var date: Date!

            beforeEach {
                let dateComponents = DateComponents.init(year: 1987, month: 12, day: 21)
                date = Calendar.current.date(from: dateComponents)
            }
            
            describe("when uses class helper func") {
                let date = Date()
                let month = Calendar.current.component(.month, from: date)
                
                it("month should match") {
                    expect(Date.currentMonth).to(equal(month))
                }
            }
            
            describe(".isWeekend") {
                describe("when is Saturday") {
                    let dateComponents = DateComponents.init(year: 1987, month: 12, day: 19)
                    let date = Calendar.current.date(from: dateComponents)!
                    
                    let random = 7 * Int.random(in: 0...999)
                    
                    let dateAdvanced = Calendar.current.date(byAdding: .day, value: random, to: date)!
                    
                    it("isWeekend name must true") {
                        expect(dateAdvanced.isWeekend).to(beTrue())
                    }
                }
                
                describe("when is Sunday") {
                    let dateComponents = DateComponents.init(year: 1987, month: 12, day: 20)
                    let date = Calendar.current.date(from: dateComponents)!
                    
                    let random = 7 * Int.random(in: 0...999)
                    
                    let dateAdvanced = Calendar.current.date(byAdding: .day, value: random, to: date)!
                    
                    it("isWeekend name must true") {
                        expect(dateAdvanced.isWeekend).to(beTrue())
                    }
                }
            }

            describe("when date is used") {
                it("day must match") {
                    expect(date.day).to(equal(21))
                }
                
                it("month must match") {
                    expect(date.month).to(equal(12))
                }
                
                it("year must match") {
                    expect(date.year).to(equal(1987))
                }
                
                it("weekDayName name must match") {
                    expect(date.weekDayName).to(equal("Monday"))
                }
                
                it("monthName name must match") {
                    expect(date.monthName).to(equal("December"))
                }
                
                it("isWeekend name must false") {
                    expect(date.isWeekend).to(beFalse())
                }
                
                it("isInCurrentMonth name must false") {
                    expect(date.isInCurrentMonth).to(beFalse())
                }
                
                it("isSameMonth name must false") {
                    expect(date.isSameMonth(of: Date())).to(beFalse())
                }
                
                describe("and is same month") {
                    let dateComponents = DateComponents.init(year: 1987, month: 12, day: 21)
                    date = Calendar.current.date(from: dateComponents)
                    
                    let newDate = Calendar.current.date(byAdding: .day, value: -13, to: date)!
                    
                    it("isSameMonth name must true") {
                        expect(date.isSameMonth(of: newDate)).to(beTrue())
                    }
                }
                
                it("firstDayOnWeek must be Monday") {
                    expect(date.firstDayOnWeek.weekDayName).to(equal("Monday"))
                }
                
                it("firstDayOnMonth name must 1") {
                    expect(date.firstDayOnMonth.day).to(equal(1))
                }
            }
        }
    }
}
