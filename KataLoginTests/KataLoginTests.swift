//
//  KataLoginTests.swift
//  KataLoginTests
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import XCTest
@testable import KataLogin

class KataLoginTests: XCTestCase {

    private var logIn: LogIn!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let textValidators: Array<TextValidator> = [TextValidator(invalidChars: [";"])]
        logIn = LogIn(textValidators: textValidators, validCredentials: Credentials(username: "admin", password: "admin"))
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_should_returns_log_in_success_if_the_credentials_are_valid() {
        let credentials = Credentials(username: "admin", password: "admin")
        let result = logIn.invoke(credentials: credentials)
        
        XCTAssertEqual(.success, result)
    }
    
    func test_should_returns_log_in_success_if_invalid_username() {
        let invalidCredentials = Credentials(username: "ad;min", password: "admin")
        let result = logIn.invoke(credentials: invalidCredentials)

        XCTAssertEqual(.invalidUsername, result)
    }
    
    func test_should_returns_log_in_invalid_credantials() {
        let invalidCredentials = Credentials(username: "admin", password: "notValidPass")
        let result = logIn.invoke(credentials: invalidCredentials)

        XCTAssertEqual(.invalidUsernameAndPassowrd, result)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
