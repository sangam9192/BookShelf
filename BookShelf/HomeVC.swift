//
//  ViewController.swift
//  BookShelf
//
//  Created by Sangam KS on 26/09/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBAction func logout(_ sender: AnyObject) {
        UserServiceImpl.logout()
        let userStoryBoard = UIStoryboard(name: "User", bundle: nil)
        let signinVC = userStoryBoard.instantiateViewController(withIdentifier: "signin")
        present(signinVC, animated: true, completion: nil)
    }
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var string = "Welcome " + (UserDefaults.standard.value(forKey: "username") as! String)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = string
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    
}

