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
                let homeVC = mainStoryBoard.instantiateViewController(withIdentifier: "main") 
                self.present(homeVC, animated: true, completion: {})
            }else{
            
            }
        })
    
    }

}
