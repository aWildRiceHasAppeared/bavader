//
//  LoginViewController.swift
//  bavarder
//
//  Created by Irving Hsu on 5/25/18.
//  Copyright © 2018 Irving Hsu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    let firebaseLogin = FirebaseLogin()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        firebaseLogin.userLogin(email: self.emailTextfield, password: self.passwordTextfield) {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    
    @IBOutlet weak var registerButton: UIButton!

}
