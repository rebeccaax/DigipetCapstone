//
//  LessonStart.swift
//  Digipet
//
//  Created by Katie Katz on 3/7/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

extension UILabel {
    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return (rHeight / charSize) + 1
    }
}

class LessonStart : UIViewController {
    
    var level : String = "0"
    var lesson : Lesson?
    var lang = 0
    
    @IBOutlet weak var startBox: UIView!
    @IBOutlet weak var petImg: UIImageView!
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var lessonDesc: UILabel!
    @IBOutlet weak var talkButton: LessonButton!
    @IBOutlet weak var typeButton: LessonButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch level {
        case "1":
            view.backgroundColor = UIColor(red: 159/255.0, green: 1, blue: 159/255.0, alpha: 1)
        case "2":
            view.backgroundColor = UIColor(red: 252/255.0, green: 138/255.0, blue: 1, alpha: 1)
        case "3":
            view.backgroundColor = UIColor(red: 249/255.0, green: 189/255.0, blue: 83/255.0, alpha: 1)
        case "4":
            view.backgroundColor = UIColor(red: 234/255.0, green: 108/255.0, blue: 169/255.0, alpha: 1)
        case "5":
            view.backgroundColor = UIColor(red: 148/255.0, green: 250/255.0, blue: 1, alpha: 1)
        case "6":
            view.backgroundColor = UIColor(red: 247/255.0, green: 229/255.0, blue: 99/255.0, alpha: 1)
        default:
            view.backgroundColor = .white
        }
        
        startBox.layer.borderColor = UIColor.black.cgColor
        startBox.layer.borderWidth = 3
        startBox.layer.cornerRadius = 10
        
        if let language = UserDefaults.standard.string(forKey: "language") {
            switch language {
            case "zh_Hans":
                lang = 0
                break
            case "fr_FR":
                lang = 2
                break
            case "es_ES":
                lang = 1
                break
            default:
                lang = 0
                
            }
        } else {
            lang = 0
        }
        
        petImg.image = UIImage(named: (lesson?.petImg[lang])!)
        
        lessonName.text = lesson?.name.uppercased()
        
        if lessonName.numberOfVisibleLines > 1 {
            lessonDesc.numberOfLines = 3
        }
        //YOU STILL NEED TO MOVE THE TEXT UP HERE!!!!!
        
        lessonDesc.text = lesson?.startDesc
        
        talkButton.layer.borderColor = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1).cgColor
        talkButton.layer.cornerRadius = 14
        talkButton.layer.masksToBounds = true
        talkButton.layer.borderWidth = 2
        talkButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        
        typeButton.layer.borderColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1).cgColor
        typeButton.layer.cornerRadius = 14
        typeButton.layer.masksToBounds = true
        typeButton.layer.borderWidth = 2
        typeButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        
        
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func typeButtonTouched(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: (lesson?.fileDest)! + "TypeView")
            
        // nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    @IBAction func talkButtonTouched(_ sender: Any) {
        self.transitioningDelegate = RZTransitionsManager.shared()
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: (lesson?.fileDest)! + "TalkView")
        // nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
        self.present(nextViewController!, animated:true) {}
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    
}
