//
//  ViewController.swift
//  KataLogin
//
//  Created by Artur Costa-Pazo on 07/05/2019.
//  Copyright © 2019 Biometrics Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KataView {
    
    var presenter: KataPresenter!

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var buttonLogIn: UIButton!
    @IBOutlet weak var buttonLogOut: UIButton!
    
   
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    func showLogInForm() {
        username.isHidden = false
        password.isHidden = false
        usernameLabel.isHidden = false
        passwordLabel.isHidden = false
        buttonLogIn.isHidden = false
        buttonLogOut.isHidden = true
    }
    
    func showLogOutForm() {
        username.isHidden = true
        password.isHidden = true
        usernameLabel.isHidden = true
        passwordLabel.isHidden = true
        buttonLogIn.isHidden = true
        buttonLogOut.isHidden = false
        username.text = nil
        password.text = nil
    }
    
    func showErrorMessage(message: String) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLogOut.isHidden = true
        
        let validCredentials = Credentials(username: "admin",
                                           password: "admin")
        
        let logIn = LogIn(textValidators: [TextValidator(invalidChars: [";", ".", ":"])],
                          validCredentials: validCredentials)
        
        let logOut = LogOut(time: Time())

        presenter = KataPresenter(view: self, login: logIn, logout: logOut)
    }
    
   
    @IBAction func logIn(_ sender: Any) {
        let usernameText = username?.text
        let passwordText = password?.text
        
        let givenCredentials = Credentials(username: usernameText!,
                                      password: passwordText!)
        
        presenter.onLogInButtonClick(credentials: givenCredentials)
    }
    
    @IBAction func logOut(_ sender: Any) {
        presenter.onLogOutButtonClick()
    }
}

