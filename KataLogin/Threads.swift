//
//  Threads.swift
//  KataLogin
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import Foundation

class MainThread {
    
    open func run(block: @escaping () -> Unit) {
        DispatchQueue.main.async {
            block()
        }
    }
}

class BackgroundThread {
    
    open func run(block: @escaping () -> Unit) {
        DispatchQueue.global(qos: .background).async {
            block()
        }
            
    }
}

class FakeMainThread: MainThread {
    
    override func run(block: @escaping () -> Unit) {
        block()
    }
}

class BackgroundMainThread: BackgroundThread {
    
    override func run(block: @escaping () -> Unit) {
        block()
    }
}
