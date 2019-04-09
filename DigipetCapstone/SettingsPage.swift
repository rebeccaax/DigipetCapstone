//
//  SettingsPage.swift
//  DigipetCapstone
//
//  Created by Timothy Obiso on 5/14/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//
import Foundation
import UIKit

class SettingsPage : UIViewController {
    var mainScreen: MainScreen?
    
    @IBOutlet weak var chineseButton: UIButton!
    @IBOutlet weak var spanishButton: UIButton!
    @IBOutlet weak var frenchButton: UIButton!
    @IBOutlet weak var currentLanguage: UILabel!
    @IBOutlet weak var test: UIButton!
    
    @IBOutlet weak var username: UITextField!
    
    
    
    let languages = ["中文", "Français","Español"]
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.string(forKey: "language") == "zh_Hans" {
            currentLanguage.text = "中文"
        } else if UserDefaults.standard.string(forKey: "language") == "es_ES" {
            currentLanguage.text = "Español"
        } else {
            currentLanguage.text = "Français"
        }
    }
    @IBAction func pressChinese(_ sender: Any) {
        UserDefaults.standard.set("zh_Hans", forKey: "language")
        currentLanguage.text = "中文"
    }
    
    @IBAction func pressSpanish(_ sender: Any) {
        UserDefaults.standard.set("es_ES", forKey: "language")
        currentLanguage.text = "Español"
        
    }
    @IBAction func pressFrench(_ sender: Any) {
        UserDefaults.standard.set("fr_FR", forKey: "language")
        currentLanguage.text = "Français"
    }
    // stan loona
   
    @IBAction func pressTest(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "navigationView")
        nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "language") == "zh_Hans" {
            mainScreen?.pet.image = UIImage(named: "china")
        } else if UserDefaults.standard.string(forKey: "language") == "es_ES" {
            mainScreen?.pet.image = UIImage(named: "spain")
        } else {
            mainScreen?.pet.image = UIImage(named: "france")
        }
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func logoutTapped(_ sender: Any) {
        print("logouttapped")
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
