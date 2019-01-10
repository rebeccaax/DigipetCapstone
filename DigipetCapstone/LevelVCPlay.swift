//
//  LevelVCPlay.swift
//  DigipetCapstone
//
//  Created by Emma Ingallinera on 5/14/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class LevelVCPlay : UIViewController {
    
    var l1Games = [Minigame]()
    var l2Games = [Minigame]()
    var l3Games = [Minigame]()
    var l4Games = [Minigame]()
    var l5Games = [Minigame]()
    var l6Games = [Minigame]()
    
    let minigame1 = Minigame(name: "Basics I", prevImg: "china", fileDest: "L1GameOne", infoVH: "walk in this direction for x number of steps", infoDir: "Guide the pet throught the maze!", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame2 = Minigame(name: "Basics II", prevImg: "china", fileDest: "L1GameTwo", infoVH: "apple, man, woman, dog, cat, picture, people, draw, sing...", infoDir: "Match cards and say what's on them to collect them.", startDesc: "Learn basic nouns, verbs, and numbers.")!
    let minigame3 = Minigame(name: "testing", prevImg: "china", fileDest: "ha2", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame4 = Minigame(name: "bwahaha", prevImg: "china", fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame5 = Minigame(name: "will this work?", prevImg: "china", fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame6 = Minigame(name: "abcxyz123", prevImg: "china", fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let minigame7 = Minigame(name: "Nikki Blonsky", prevImg: "china", fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoDir: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    
    
    let colorDef = UIColor(red: 127/255.0, green: 70/255.0, blue: 221/255.0, alpha: 1)
    let color1 = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1)
    let color2 = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
    let color3 = UIColor(red: 251/255.0, green: 174/255.0, blue: 23/255.0, alpha: 1)
    let color4 = UIColor(red: 237/255.0, green: 30/255.0, blue: 121/255.0, alpha: 1)
    let color5 = UIColor(red: 6/255.0, green: 232/255.0, blue: 1, alpha: 1)
    let color6 = UIColor(red: 252/255.0, green: 238/255.0, blue: 34/255.0, alpha: 1)
    
    var text:String = "0"
    var showInfo:String = "nil"
    var tableViewController : GameTableViewController?
    var minigameFocus : Minigame?
    
    @IBOutlet weak var minigameNumber: UILabel!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoMinigameName: UILabel!
    @IBOutlet weak var infoVH: UILabel!
    @IBOutlet weak var infoDir: UILabel!
    @IBOutlet weak var infoStartButton: GameButton!
    @IBOutlet weak var infoBackButton: GameButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tableController = childViewControllers.first as? GameTableViewController else {
            fatalError("uh oh where'd the TVC go???")
        }
        
        tableViewController = tableController
        blur.alpha = 0
        
        infoView.layer.borderColor = UIColor.black.cgColor
        infoView.layer.borderWidth = 3
        infoView.layer.cornerRadius = 10
        infoMinigameName.text = minigameFocus?.name
        infoVH.text = minigameFocus?.infoVH
        infoDir.text = minigameFocus?.infoDir
        infoStartButton.layer.borderColor = color1.cgColor
        infoStartButton.layer.cornerRadius = 14
        infoStartButton.layer.masksToBounds = true
        infoStartButton.layer.borderWidth = 2
        infoStartButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        infoBackButton.layer.borderColor = color2.cgColor
        infoBackButton.layer.cornerRadius = 14
        infoBackButton.layer.masksToBounds = true
        infoBackButton.layer.borderWidth = 2
        infoBackButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        
        infoView.alpha = 0
        
        
        //lessons test code
        l1Games += [minigame1, minigame2, minigame3, minigame4, minigame5, minigame6]
        l2Games += [minigame7]
        
        minigameNumber?.text = text
        tableViewController!.gameNumber = text
        switch text {
        case "1":
            minigameNumber?.textColor = color1
            tableViewController?.minigameList = l1Games
            tableViewController?.color = color1.cgColor
        case "2":
            minigameNumber?.textColor = color2
            tableViewController?.minigameList = l2Games
            tableViewController?.color = color2.cgColor
        case "3":
            minigameNumber?.textColor = color3
            tableViewController?.minigameList = l3Games
            tableViewController?.color = color3.cgColor
        case "4":
            minigameNumber?.textColor = color4
            tableViewController?.minigameList = l4Games
            tableViewController?.color = color4.cgColor
        case "5":
            minigameNumber?.textColor = color5
            tableViewController?.minigameList = l5Games
            tableViewController?.color = color5.cgColor
        case "6":
            minigameNumber?.textColor = color6
            tableViewController?.minigameList = l6Games
            tableViewController?.color = color6.cgColor
        default:
            fatalError("game clicked wasn't 1-6???")
        }
        
        if showInfo == "yes" {
            blur.alpha = 1
            infoView.alpha = 1
            infoStartButton.minigame = minigameFocus
        }
        
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        print("start button tapped")
        
        self.blur.alpha = 0
        self.infoView.alpha = 0
        showInfo = "nil"
        RZTransitionsManager.shared().defaultPresentDismissAnimationController = RZCirclePushAnimationController()
        
        RZTransitionsManager.shared().defaultPushPopAnimationController = RZCirclePushAnimationController()
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "L1GameOneTalkView")
        print("go to this controller")
        /*(nextViewController as! MinigameStart).level = text
         (nextViewController as! MinigameStart).minigame = minigameFocus
         nextViewController?.transitioningDelegate = RZTransitionsManager.shared()*/
        self.present(nextViewController!, animated:true) {}
        RZTransitionsManager.shared().defaultPresentDismissAnimationController = RZCardSlideAnimationController()
        RZTransitionsManager.shared().defaultPushPopAnimationController = RZCardSlideAnimationController()
    }
    
    @IBAction func infoBackButtonTouched(_ sender: Any) {
        UIView.animate(withDuration: 0.3){
            self.blur.alpha = 0
            self.infoView.alpha = 0
        }
        showInfo = "nil"
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
