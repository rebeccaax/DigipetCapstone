//
//  NavigationViewController.swift
//  DigipetCapstone
//
//  Created by Sophia Zuo on 4/5/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class NavigationViewController : UIViewController {
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var shouldAutorotate: Bool {
        return true
    }
    
    @IBAction func pressLogin(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "LogInPage")
        // nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    @IBAction func pressSignUp(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")
        // nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    @IBAction func pressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
