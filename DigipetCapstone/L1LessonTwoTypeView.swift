//
//  L1LessonTwoTypeView.swift
//  Digipet
//
//  Created by Nicholas Kassoy on 5/2/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class L1LessonTwoTypeView : UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var talkButton: UIButton!
    @IBOutlet weak var myView: SKView!
    
    
    var myScene: L1LessonTwo = L1LessonTwo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //myView.presentScene(myScene)
    }

    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func answerDone(_ sender: UITextField) {
        let correct: Bool = (myView.scene as! L1LessonTwo).checkAnswer(answer: textField.text!)
        let done: Bool! = (myView.scene as! L1LessonTwo).isDone()
        
        if (correct) {
            textField.text = ""
        }
        
        if (correct && done) {
            //self.transitioningDelegate = RZTransitionsManager.shared()
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: "matchGame")
            //nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
            self.present(nextViewController!, animated: true) {}
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        textField.becomeFirstResponder()
    }
    
    func revealButton() {
        talkButton.isHidden = false
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
