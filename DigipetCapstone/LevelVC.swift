//
//  LevelVC.swift
//  Digipet
//
//  Created by Katie Katz on 3/2/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class LevelVC : UIViewController {
    
    var l1Lessons = [Lesson]()
    var l2Lessons = [Lesson]()
    var l3Lessons = [Lesson]()
    var l4Lessons = [Lesson]()
    var l5Lessons = [Lesson]()
    var l6Lessons = [Lesson]()
    
    // todo many of these contain placeholder information that is garbage
    let lesson1 = Lesson(name: "Basics I", petImg: ["china", "spain", "france"], fileDest: "L1LessonOne", infoVH: "hello, goodbye, yes, no, maybe, okay, please, thank you, you're welcome, good morning...", infoGD: "Guess the object is based on the silhouette.", startDesc: "Review basic vocabulary and greetings.")!
    let lesson2 = Lesson(name: "Basics II", petImg: ["china", "spain", "france"], fileDest: "L1LessonTwo", infoVH: "apple, man, woman, dog, cat, picture, people, draw, sing...", infoGD: "Match the cards and say what's on them to collect them.", startDesc: "Review basic nouns, verbs, and numbers.")!
    let lesson3 = Lesson(name: "Basics III", petImg: ["china", "spain", "france"], fileDest: "L1LessonThree", infoVH: "bread, egg, rice, meat, food, milk, juice, water, fruit, vegetables, dessert", infoGD: "Guide the pet through a maze while reviewing direciton vocabulary", startDesc: "Review foods and drinks.")!
    let lesson4 = Lesson(name: "Basics IV", petImg: ["china", "spain", "france"], fileDest: "L1LessonFour", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoGD: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let lesson5 = Lesson(name: "Basics V", petImg: ["china", "spain", "france"], fileDest: "L1LessonFive", infoVH: "color, red, orange, yellow, green, blue, purple, black, white, brown, pink, gray", infoGD: "Match the cards and say what's on them to collect them", startDesc: "Learn colors!")!
    let lesson6 = Lesson(name: "Future Lesson 6", petImg: ["china", "spain", "france"], fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoGD: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    let lesson7 = Lesson(name: "Future Lesson 1", petImg: ["china", "spain", "france"], fileDest: "ha", infoVH: "vocab vocab vocab najadea aeijfubaw dwfaef", infoGD: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!

    
    let colorDef = UIColor(red: 127/255.0, green: 70/255.0, blue: 221/255.0, alpha: 1)
    let color1 = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1)
    let color2 = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
    let color3 = UIColor(red: 251/255.0, green: 174/255.0, blue: 23/255.0, alpha: 1)
    let color4 = UIColor(red: 237/255.0, green: 30/255.0, blue: 121/255.0, alpha: 1)
    let color5 = UIColor(red: 6/255.0, green: 232/255.0, blue: 1, alpha: 1)
    let color6 = UIColor(red: 252/255.0, green: 238/255.0, blue: 34/255.0, alpha: 1)
    
    var text:String = "0"
    var showInfo:String = "nil"
    var tableViewController : LessonTableViewController?
    var lessonFocus : Lesson?
    
    @IBOutlet weak var lessonNumber: UILabel!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoLessonName: UILabel!
    @IBOutlet weak var infoVH: UILabel!
    @IBOutlet weak var infoGD: UILabel!
    @IBOutlet weak var infoStartButton: LessonButton!
    @IBOutlet weak var infoBackButton: LessonButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tableController = childViewControllers.first as? LessonTableViewController else {
            fatalError("uh oh where'd the TVC go???")
        }
        
        tableViewController = tableController
        blur.alpha = 0
        
        infoView.layer.borderColor = UIColor.black.cgColor
        infoView.layer.borderWidth = 3
        infoView.layer.cornerRadius = 10
        infoLessonName.text = lessonFocus?.name
        infoVH.text = lessonFocus?.infoVH
        infoGD.text = lessonFocus?.infoGD
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
        l1Lessons += [lesson1, lesson2, lesson3, lesson4, lesson5, lesson6]
        l2Lessons += [lesson7]
        
        lessonNumber?.text = text
        tableViewController!.lessonNumber = text
        switch text {
        case "1":
            lessonNumber?.textColor = color1
            tableViewController?.lessonList = l1Lessons
            tableViewController?.color = color1.cgColor
        case "2":
            lessonNumber?.textColor = color2
            tableViewController?.lessonList = l2Lessons
            tableViewController?.color = color2.cgColor
        case "3":
            lessonNumber?.textColor = color3
            tableViewController?.lessonList = l3Lessons
            tableViewController?.color = color3.cgColor
        case "4":
            lessonNumber?.textColor = color4
            tableViewController?.lessonList = l4Lessons
            tableViewController?.color = color4.cgColor
        case "5":
            lessonNumber?.textColor = color5
            tableViewController?.lessonList = l5Lessons
            tableViewController?.color = color5.cgColor
        case "6":
            lessonNumber?.textColor = color6
            tableViewController?.lessonList = l6Lessons
            tableViewController?.color = color6.cgColor
        default:
            fatalError("lesson clicked wasn't 1-6???")
        }
        
        if showInfo == "yes" {
            blur.alpha = 1
            infoView.alpha = 1
            infoStartButton.lesson = lessonFocus
        }
        
    }

    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        self.blur.alpha = 0
        self.infoView.alpha = 0
        showInfo = "nil"
    RZTransitionsManager.shared().defaultPresentDismissAnimationController = RZCirclePushAnimationController()
        
        RZTransitionsManager.shared().defaultPushPopAnimationController = RZCirclePushAnimationController()
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "lessonStart")
        (nextViewController as! LessonStart).level = text
        (nextViewController as! LessonStart).lesson = lessonFocus
        // nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
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
