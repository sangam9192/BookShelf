//
//  LoginVC.swift
//  BookShelf
//
//  Created by Sangam KS on 28/09/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class SigninVC: UIViewController{

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    @IBAction func forgotPassword(_ sender: AnyObject) {
        let userStoryBoard = UIStoryboard(name: "User", bundle: nil)
        let forgotPasswordVC = userStoryBoard.instantiateViewController(withIdentifier: "signup") as! SignUpVC
        forgotPasswordVC.signUp = false
        self.present(forgotPasswordVC, animated: true, completion: nil)
    }
    
    @IBAction func signIn(_ sender: AnyObject) {
        guard let username = usernameField.text else{
            return
        }
        guard let password = passwordField.text else {
            return
        }
        
        UserServiceImpl().login(username: username, password: password, completion: {(status, message) in
            if status {
                let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = mainStoryBoard.instantiateViewController(withIdentifier: "main")
                self.present(mainVC, animated: true, completion: nil)
            }else{
                UIUtil.displayAlert(self, title: "Error", message: message)
            }
        })
    
    }

    @IBAction func signUp(_ sender: AnyObject) {
        let userStoryBoard = UIStoryboard(name: "User", bundle: nil)
        let forgotPasswordVC = userStoryBoard.instantiateViewController(withIdentifier: "signup") as! SignUpVC
        self.present(forgotPasswordVC, animated: true, completion: nil)
    }
}
