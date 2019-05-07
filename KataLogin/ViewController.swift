//
//  ViewController.swift
//  KataLogin
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

    }
    
    @IBAction func logIn(_ sender: Any) {
    
        if button.titleLabel?.text == "Log In"{
            checkUsername(invalidChar: ",")
            checkUsername(invalidChar: ".")
            checkUsername(invalidChar: ";")
            
            if validateCredentials(){
                button.setTitle("Log Out",for: .normal)
                showToast(message: "Yeah")
            }
            else{
                showToast(message: "Not valid credentials")
            }
        }
        else {
            button.setTitle("Log In",for: .normal)
            username.text = ""
            password.text = ""
        }
    }
    
    
    
    func validateCredentials() -> Bool{
        let usernameText = username?.text
        let passwordText = password?.text

        var hasValidCredentials = true
        if usernameText != "admin" {
            hasValidCredentials = false
        }
        if passwordText != "admin" {
            hasValidCredentials = false
        }
        return hasValidCredentials
    }
    
    func checkUsername(invalidChar: String){
        
        let text = username?.text
        if (text!.contains(invalidChar)){
            showToast(message: "Invalid username. \(invalidChar) not allowed")
        }
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}

