//
//  flowtimeTests.swift
//  flowtimeTests
//
//  Created by Leonardo Migliorelli on 04/11/22.
//

import XCTest
@testable import FlowTime
//TODO import not working
final class FlowTimeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func soundAlarmTest() throws {
        let alarm = SoundAlarm(10)
        alarm.play()
    }
    func alarmTest() throws {
        let alarm = Alarm(100)
        assert(alarm.rawSeconds == 100, "Alarm not correctly initialized with 100 seconds")
    }

    func stopWatchTest() throws {
        let stopWatch = StopWatch()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

