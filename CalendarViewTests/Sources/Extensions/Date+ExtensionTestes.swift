import XCTest

@testable import CalendarView

class DateExtensionTests: XCTestCase {
    
    func test_Current_Month() {
        given("current date") {
            let date = Date()
            
            when("uses class helper func") {
                let month = Calendar.current.component(.month, from: date)
                
                then("month should match") {
                    XCTAssertEqual(Date.currentMonth, month)
                }
            }
        }
    }
    
    func test_Weekend() {
        given("a random saturday") {
            let dateComponents = DateComponents.init(year: 1987, month: 12, day: 19)
            let date = Calendar.current.date(from: dateComponents)!
            let random = 7 * Int.random(in: 0...999)
            let dateAdvanced = Calendar.current.date(byAdding: .day, value: random, to: date)!
            
            when("uses the isWeekend func") {
                then("should get TRUE") {
                    XCTAssertTrue(dateAdvanced.isWeekend)
                }
            }
        }
        
        given("a random sunday") {
            let dateComponents = DateComponents.init(year: 1987, month: 12, day: 20)
            let date = Calendar.current.date(from: dateComponents)!
            let random = 7 * Int.random(in: 0...999)
            let dateAdvanced = Calendar.current.date(byAdding: .day, value: random, to: date)!
            
            when("uses the isWeekend func") {
                then("should get TRUE") {
                    XCTAssertTrue(dateAdvanced.isWeekend)
                }
            }
        }
        
        given("a random monday") {
            let dateComponents = DateComponents.init(year: 1987, month: 12, day: 21)
            let date = Calendar.current.date(from: dateComponents)!
            let random = 7 * Int.random(in: 0...999)
            let dateAdvanced = Calendar.current.date(byAdding: .day, value: random, to: date)!
            
            when("uses the isWeekend func") {
                then("should get FALSE") {
                    XCTAssertFalse(dateAdvanced.isWeekend)
                }
            }
        }
        
        given("a random tuesday") {
            let dateComponents = DateComponents.init(year: 1987, month: 12, day: 22)
            let date = Calendar.current.date(from: dateComponents)!
            let random = 7 * Int.random(in: 0...999)
            let dateAdvanced = Calendar.current.date(byAdding: .day, value: random, to: date)!
            
            when("uses the isWeekend func") {
                then("should get FALSE") {
                    XCTAssertFalse(dateAdvanced.isWeekend)
                }
            }
        }
        
        given("a random wednesday") {
            let dateComponents = DateComponents.init(year: 1987, month: 12, day: 23)
            let date = Calendar.current.date(from: dateComponents)!
            let random = 7 * Int.random(in: 0...999)
            let dateAdvanced = Calendar.current.date(byAdding: .day, value: random, to: date)!
            
            when("uses the isWeekend func") {
                then("should get FALSE") {
                    XCTAssertFalse(dateAdvanced.isWeekend)
                }
            }
        }
        
        given("a random thursday") {
            let dateComponents = DateComponents.init(year: 1987, month: 12, day: 24)
            let date = Calendar.current.date(from: dateComponents)!
            let random = 7 * Int.random(in: 0...999)
            let dateAdvanced = Calendar.current.date(byAdding: .day, value: random, to: date)!
            
            when("uses the isWeekend func") {
                then("should get FALSE") {
                    XCTAssertFalse(dateAdvanced.isWeekend)
                }
            }
        }
        
        given("a random friday") {
            let dateComponents = DateComponents.init(year: 1987, month: 12, day: 25)
            let date = Calendar.current.date(from: dateComponents)!
            let random = 7 * Int.random(in: 0...999)
            let dateAdvanced = Calendar.current.date(byAdding: .day, value: random, to: date)!
            
            when("uses the isWeekend func") {
                then("should get FALSE") {
                    XCTAssertFalse(dateAdvanced.isWeekend)
                }
            }
        }
    }
    
    func test_Date_Helper_Functions() {
        given("a base date (12/21/1987)") {
            let dateComponents = DateComponents.init(year: 1987, month: 12, day: 21)
            let date = Calendar.current.date(from: dateComponents)!
            
            when("uses day") {
                then("must match") {
                    XCTAssertEqual(date.day, 21)
                }
            }
            
            when("uses month") {
                then("must match") {
                    XCTAssertEqual(date.month, 12)
                }
            }
            
            when("uses year") {
                then("must match") {
                    XCTAssertEqual(date.year, 1987)
                }
            }
            
            when("uses weekDayName") {
                then("must match") {
                    XCTAssertEqual(date.weekDayName, "Monday")
                }
            }
            
            when("uses monthName") {
                then("must match") {
                    XCTAssertEqual(date.monthName, "December")
                }
            }
            
            when("uses isInCurrentMonth") {
                then("must be false") {
                    XCTAssertFalse(date.isInCurrentMonth)
                }
            }
            
            when("uses isSameMonth") {
                then("must be false") {
                    XCTAssertFalse(date.isSameMonth(of: Date()))
                }
            }
        }
    }
    
    func test_SameMonth() {
        given("a date") {
            let dateComponents = DateComponents.init(year: 1987, month: 12, day: 21)
            let date = Calendar.current.date(from: dateComponents)!
            
            when("comparing with date in same month") {
                let newDate = Calendar.current.date(byAdding: .day, value: -13, to: date)!
                
                then("isSameMonth must true") {
                    XCTAssertTrue(date.isSameMonth(of: newDate))
                }
            }
        }
    }
}
