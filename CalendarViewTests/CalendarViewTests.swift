//
//  CalendarViewTests.swift
//  CalendarViewTests
//
//  Created by Agripino Damasceno on 26/05/21.
//

import XCTest
@testable import CalendarView

class CalendarViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

func given<A>(_ description: String, block: () throws -> A) rethrows -> A {
    Logger.logInfo(description, scope: "1º Given %{public}@")
    return try XCTContext.runActivity(named: "Given " + description, block: { _ in try block() })
}

func when<A>(_ description: String, block: () throws -> A) rethrows -> A {
    Logger.logInfo(description, scope: "2º When %{public}@")
    return try XCTContext.runActivity(named: "When " + description, block: { _ in try block() })
}

func then<A>(_ description: String, block: () throws -> A) rethrows -> A {
    Logger.logInfo(description, scope: "3º Then %{public}@")
    return try XCTContext.runActivity(named: "Then " + description, block: { _ in try block() })
}
