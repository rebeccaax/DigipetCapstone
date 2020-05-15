//
//  L1LessonThreeTypeView.swift
//  DigipetCapstone
//
//  Created by Cassandra on 3/21/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class L1LessonThreeTypeView : UIViewController {
    
    @IBOutlet weak var myView: SKView!
    
    @IBOutlet weak var talkButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var myScene: L1LessonThree = L1LessonThree()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //myView.presentScene(myScene)
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.searchBar.endEditing(true)
    }
    
    @IBAction func answerDone(_ sender: UITextField) {
        //myScene.checkAnswer(answer: textField.text!)
        print("answerdone!")
        let correct: Bool = (myView.scene as! L1LessonThree).checkAnswer(answer: textField.text!)
        let done: Bool! = (myView.scene as! L1LessonThree).isDone()
        
        if (correct) {
            textField.text = ""
        }
        
        if (correct && done) {
            self.transitioningDelegate = RZTransitionsManager.shared()
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: "silhouetteGame")
            nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
            self.present(nextViewController!, animated: true) {}
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        textField.becomeFirstResponder()
        //delegate?.die()
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

