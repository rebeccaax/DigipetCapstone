//
//  LoginPage.swift
//  DigipetCapstone
//
//  Created by Sophia Zuo on 4/8/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//
import Foundation
import UIKit

class LoginPage : UIViewController {
    
    var usernameLabel:String = ""
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func LoginTapped(_ sender: Any) {
        print("login tapped")
        
    }
    @IBAction func pressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
