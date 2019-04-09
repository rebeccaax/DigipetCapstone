//
//  testpagetry.swift
//  DigipetCapstone
//
//  Created by Sophia Zuo on 4/8/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class testpagetry : UIViewController {
    
    @IBOutlet weak var testbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func testbuttonpress(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "NavigationView")
        nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
}
