//
//  MinigameCongrats.swift
//  DigipetCapstone
//
//  Created by Loaner on 1/11/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//

import UIKit

extension UILabel {
    /*var numberOfVisibleLines: Int {
     let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
     let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
     let charSize: Int = lroundf(Float(self.font.pointSize))
     return (rHeight / charSize) + 1
     }
     } */
    
    class MinigameCongrats : UIViewController {
        
        var level : String = "0"
        var minigame : Minigame?
        var lang = 0
        
        @IBOutlet weak var startBox: UIView!
        @IBOutlet weak var petImg: UIImageView!
        @IBOutlet weak var minigameName: UILabel!
        @IBOutlet weak var minigameDesc: UILabel!
        @IBOutlet weak var homeButton: GameButton!
        @IBOutlet weak var againButton: GameButton!
        
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
            
            /*petImg.image = UIImage(named: (minigame?.prevImg[lang])!)*/
            
            minigameName.text = minigame?.name.uppercased()
            
            if minigameName.numberOfVisibleLines > 1 {
                minigameDesc.numberOfLines = 3
            }
            //YOU STILL NEED TO MOVE THE TEXT UP HERE!!!!!
            
            minigameDesc.text = minigame?.startDesc
            
            homeButton.layer.borderColor = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1).cgColor
            homeButton.layer.cornerRadius = 14
            homeButton.layer.masksToBounds = true
            homeButton.layer.borderWidth = 2
            homeButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
            
            againButton.layer.borderColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1).cgColor
            againButton.layer.cornerRadius = 14
            againButton.layer.masksToBounds = true
            againButton.layer.borderWidth = 2
            againButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
            
            
        }
        
        @IBAction func backButtonTouched(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
        }
        
        @IBAction func againButtonTouched(_ sender: Any) {
            self.transitioningDelegate = RZTransitionsManager.shared()
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: (minigame?.fileDest)! + "TypeView")
            nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
            self.present(nextViewController!, animated:true) {}
        }
        
        @IBAction func homeButtonTouched(_ sender: Any) {
            self.transitioningDelegate = RZTransitionsManager.shared()
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: (minigame?.fileDest)! + "TalkView")
            nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
            self.present(nextViewController!, animated:true) {}
        }
        
        override var prefersStatusBarHidden: Bool {
            return true
        }
        
        
    }
}

