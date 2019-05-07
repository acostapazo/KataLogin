//
//  KataLogOutTest.swift
//  KataLoginTests
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import XCTest
@testable import KataLogin

class KataLogOutTests: XCTestCase {
       
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_should_return_true_if_the_second_is_even() {
        
        let mockTime = MockTime(mockerCurrentSecond: 2000)
        let logOut = LogOut(time: mockTime)
        
        XCTAssertEqual(true, logOut.invoke())
    }
    
    func test_should_return_false_if_the_second_is_not_even() {
        
        let mockTime = MockTime(mockerCurrentSecond: 2001)
        let logOut = LogOut(time: mockTime)
        
        XCTAssertEqual(false, logOut.invoke())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
