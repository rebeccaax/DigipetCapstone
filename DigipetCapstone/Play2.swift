//
//  Play2.swift
//  DigipetCapstone
//
//  Created by Katie Katz on 5/14/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class Play2 : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func levelOneTouched(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "mazeGame")
        nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    @IBAction func levelTwoTouched(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "bodypartsGame")
        nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}    }
    
    @IBAction func levelThreeTouched(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "matchGame")
        nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    @IBAction func levelFourTouched(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "levelVCPlay")
        (nextViewController as! LevelVCPlay).text = "1"
        nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    @IBAction func levelFiveTouched(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "levelVCPlay")
        (nextViewController as! LevelVCPlay).text = "1"
        nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    @IBAction func levelSixTouched(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "levelVCPlay")
        (nextViewController as! LevelVCPlay).text = "1"
        nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    
    override var shouldAutorotate: Bool {
        return true
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
