//
//  LogIn.swift
//  KataLogin
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import Foundation

class TextValidator{
    
    private var invalidChars: Array<String>
    
    init (invalidChars: Array<String>){
        self.invalidChars = invalidChars
    }
    
    func invoke(text: String) -> Bool{
        
        for invalidChar in invalidChars{
            if text.contains(invalidChar){
                return false
            }
        }
        return true
    }
}

class Credentials{
    
    open var username: String = ""
    open var password: String = ""
    
    init(username: String, password: String){
        self.username = username
        self.password = password
    }
}


enum LogInResult{
    case success, invalidUsername, invalidUsernameAndPassowrd
}

class LogIn{
    
    private var textValidators: Array<TextValidator>
    private var validCredentials: Credentials

    
    init (textValidators: Array<TextValidator>, validCredentials: Credentials){
        self.textValidators = textValidators
        self.validCredentials = validCredentials
    }
    
    func invoke(credentials: Credentials) -> LogInResult {
        
        for textValidator in textValidators{
            if !textValidator.invoke(text: credentials.username){
                return .invalidUsername
            }
            if !textValidator.invoke(text: credentials.password){
                return .invalidUsername
            }
            
            if credentials.username != self.validCredentials.username || credentials.password != self.validCredentials.password{
                return .invalidUsernameAndPassowrd
            }
        }
        
        return .success
    }
}
