//
//  Timer.swift
//  KataLoginTests
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import Foundation
@testable import KataLogin

class MockTime: Time {
    var _mockerCurrentSecond: Date? = nil
    
    init(mockerCurrentSecond: Date) {
        _mockerCurrentSecond = mockerCurrentSecond
    }
    
    override var now: Date{
        return _mockerCurrentSecond!
    }
}
