//
//  LogOut.swift
//  KataLogin
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import Foundation

class LogOut{
    
    private var time: Time
    
    init (time: Time){
        self.time = time
    }
    
    func invoke() -> Bool {
        return time.now() % 2 == 0
    }
}
