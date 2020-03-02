//
//  SignUpPageController.swift
//  DigipetCapstone
//
//  Created by Sophia Zuo on 4/8/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//
import Foundation
import UIKit

class SignUpPageController : UIViewController {
    
    @IBOutlet weak var back: UIButton!

    @IBOutlet weak var usernameSignUpTextField: UITextField!
    @IBOutlet weak var passwordSignUPTextField: UITextField!
    @IBOutlet weak var retypePasswordSignUpTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        print("cancel pressed")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        print("signup tapped")
        //validate that required fields are not empty
        if (usernameSignUpTextField.text?.isEmpty)! || (passwordSignUPTextField.text?.isEmpty)! ||
            (retypePasswordSignUpTextField.text?.isEmpty)! {
            //display error message
            displayMessage(userMessage: "all fields are required")
            return
        }
        
        if ((passwordSignUPTextField.text?.elementsEqual(retypePasswordSignUpTextField.text!))! != true){
            //display error message
            
            displayMessage(userMessage: "needs to have same password")
            
            return
        }
        
        //Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        
        // Call stopAnimating() when need to stop activity indicator
        //myActivityIndicator.stopAnimating()
        view.addSubview(myActivityIndicator)
        
    }
    
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                print("ok button tapped")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
                
            }
            
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func pressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
