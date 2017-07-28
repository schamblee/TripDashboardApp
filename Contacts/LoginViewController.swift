//
//  LoginViewController.swift
//  TripDashboard
//
//  Created by stephanie Chamblee on 7/27/17.
//  Copyright © 2017 Stephanie Chamblee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var failedLoginLabel: UILabel!
    
    let username = "me@me.com"
    let password = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextField.isSecureTextEntry = true
        self.tabBarController?.tabBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if usernameTextField.text != username && passwordTextField.text != password {
            failedLoginLabel.text = "Incorrect Email or Password"
        }
        else {
            performSegue(withIdentifier: "loginSegue", sender: nil)
            }
    }

    override func awakeFromNib() {
        self.tabBarItem.title = "Logout"
        self.tabBarController?.tabBar.items![3].image = UIImage(named: "logoutIcon")
        self.tabBarController?.tabBar.items![3].selectedImage = UIImage(named: "logoutIcon")
    }
}
