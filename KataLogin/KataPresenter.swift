//
//  KataPresenter.swift
//  KataLogin
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import Foundation

protocol KataView {
    func showLogInForm() -> Void
    func showLogOutForm() -> Void
    func hideLogInForm() -> Void
    func hideLogOutForm() -> Void
    func showErrorMessage(message: String) -> Void
}


class KataPresenter{
    
    var view: KataView;
    var login: LogIn;
    var logout: LogOut;

    init(view: KataView, login: LogIn, logout: LogOut) {
        self.view = view
        self.login = login
        self.logout = logout
    }
    
    func onLogInButtonClick(credentials: Credentials){
    
        let result = login.invoke(credentials: credentials)
        switch(result){
        case .success:
            view.showLogOutForm()
            view.hideLogInForm()
        case .invalidUsername:
            view.showErrorMessage(message: "Invalid Username")
        case .invalidUsernameAndPassowrd:
            view.showErrorMessage(message: "Invalid Credentials")
        }
    }
    
    func onLogOutButtonClick(){
        if (logout.invoke()){
            view.showLogInForm()
            view.hideLogOutForm()
        }
        else{
            
        }
        
    }
    
}

