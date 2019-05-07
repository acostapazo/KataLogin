//
//  KataPresenterTest.swift
//  KataLoginTests
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import XCTest
@testable import KataLogin


class MockKataView: KataView{
    
    open var showLogInFormInvoked: Bool = false
    open var showLogOutFormInvoked: Bool = false
    open var hideLogInFormInvoked: Bool = false
    open var hideLogOutFormInvoked: Bool = false
    open var shownMessage: String = ""
    
    func showLogInForm() -> Void{
        showLogInFormInvoked = true
    }
    
    func showLogOutForm() -> Void{
        showLogOutFormInvoked = true
    }
    
    func hideLogInForm() -> Void{
        hideLogInFormInvoked = true
    }
    
    func hideLogOutForm() -> Void{
        hideLogOutFormInvoked = true
    }
    
    func showErrorMessage(message: String) -> Void{
        shownMessage = message
    }
}

class KataPresenterTests: XCTestCase {
    
    var presenter: KataPresenter!
    var view: MockKataView!
    
    override func setUp() {
        let login = LogIn(textValidators: [TextValidator(invalidChars: [";", ".", "."])],
                          validCredentials: Credentials(username: "admin", password: "admin"))
        let logout = LogOut(time: MockTime(mockerCurrentSecond: Date(timeIntervalSince1970: 1)))
        
        view = MockKataView()
        presenter = KataPresenter(view: view, login: login, logout: logout)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_should_hide_log_in_form_invoked_when_credentials_are_valid() {
            let validCredentials = Credentials(username: "admin", password: "admin")
        
            presenter.onLogInButtonClick(credentials: validCredentials)
        
            XCTAssertEqual(true, view.showLogOutFormInvoked)
    }
    
    func test_should_return_invalid_username_message() {
        let invalidUsernameCredentials = Credentials(username: "adm;in", password: "admin")
        
        presenter.onLogInButtonClick(credentials: invalidUsernameCredentials)
        
        XCTAssertEqual("Invalid Username", view.shownMessage)
    }
    
    func test_should_return_invalid_credentials_message() {
        let invalidCredentials = Credentials(username: "bob", password: "dylan")
        
        presenter.onLogInButtonClick(credentials: invalidCredentials)
        
        XCTAssertEqual("Invalid Credentials", view.shownMessage)
    }
    
  

    
}
