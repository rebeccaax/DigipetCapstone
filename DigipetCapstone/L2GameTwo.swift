//
//  L2GameTwo.swift
//  DigipetCapstone
//
//  Created by Cassandra on 2/12/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class L2GameTwo : SKScene {
    
    var done: Bool = false
    
    var person: SKSpriteNode!
    
    var arm: SKSpriteNode!
    var foot: SKSpriteNode!
    var head: SKSpriteNode!
    var leg: SKSpriteNode!
    var neck: SKSpriteNode!
    var nose: SKSpriteNode!
    var shoulder: SKSpriteNode!
    var stomach: SKSpriteNode!
    
    var bodyParts: [SKSpriteNode] = []
    
    var index = 0
    
    var numAnswered = 0
    
   // var correctAnswers: [String] = []
    var correctAnswers = [["我胳膊疼。", "我胳膊疼"], ["我脚疼。", "我脚疼"], ["我头疼。", "我头疼"], ["我腿疼。", "我腿疼"], ["我嗓子疼。", "我嗓子疼"], ["我鼻子疼。", "我鼻子疼"], ["我肩膀疼。", "我肩膀疼"], ["我肚子疼。", "我肚子疼"]]
    
    let petImgs = ["china", "spain", "france"]
    
    var lang: Int = 0
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.white
        
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
        
        // switch correct answers array based on lang
        
        
        person = SKSpriteNode(imageNamed: "person")
        person.size = CGSize(width: self.frame.size.width * 0.85, height: self.frame.size.height * 0.60)
        person.anchorPoint = CGPoint(x: 0.5, y:0.4)
        person.zPosition = 0
        addChild(person)
        
        arm = SKSpriteNode(imageNamed: "arm pain")
        arm.size = CGSize(width: self.frame.size.width * 0.85, height: self.frame.size.height * 0.60)
        arm.anchorPoint = CGPoint(x: 0.5, y:0.4)
        arm.zPosition = 1
        arm.isHidden = true
        addChild(arm)
        
        foot = SKSpriteNode(imageNamed: "foot pain")
        foot.size = CGSize(width: self.frame.size.width * 0.85, height: self.frame.size.height * 0.60)
        foot.anchorPoint = CGPoint(x: 0.5, y:0.4)
        foot.zPosition = 1
        foot.isHidden = true
        addChild(foot)
        
        head = SKSpriteNode(imageNamed: "head pain")
        head.size = CGSize(width: self.frame.size.width * 0.85, height: self.frame.size.height * 0.60)
        head.anchorPoint = CGPoint(x: 0.5, y:0.4)
        head.zPosition = 1
        head.isHidden = true
        addChild(head)
        
        leg = SKSpriteNode(imageNamed: "leg pain")
        leg.size = CGSize(width: self.frame.size.width * 0.85, height: self.frame.size.height * 0.60)
        leg.anchorPoint = CGPoint(x: 0.5, y:0.4)
        leg.zPosition = 1
        leg.isHidden = true
        addChild(leg)
        
        neck = SKSpriteNode(imageNamed: "neck pain")
        neck.size = CGSize(width: self.frame.size.width * 0.85, height: self.frame.size.height * 0.60)
        neck.anchorPoint = CGPoint(x: 0.5, y:0.4)
        neck.zPosition = 1
        neck.isHidden = true
        addChild(neck)
        
        nose = SKSpriteNode(imageNamed: "nose pain")
        nose.size = CGSize(width: self.frame.size.width * 0.85, height: self.frame.size.height * 0.60)
        nose.anchorPoint = CGPoint(x: 0.5, y:0.4)
        nose.zPosition = 1
        nose.isHidden = true
        addChild(nose)
        
        shoulder = SKSpriteNode(imageNamed: "shoulder pain")
        shoulder.size = CGSize(width: self.frame.size.width * 0.85, height: self.frame.size.height * 0.60)
        shoulder.anchorPoint = CGPoint(x: 0.5, y:0.4)
        shoulder.zPosition = 1
        shoulder.isHidden = true
        addChild(shoulder)
        
        stomach = SKSpriteNode(imageNamed: "stomach pain")
        stomach.size = CGSize(width: self.frame.size.width * 0.85, height: self.frame.size.height * 0.60)
        stomach.anchorPoint = CGPoint(x: 0.5, y:0.4)
        stomach.zPosition = 1
        stomach.isHidden = true
        addChild(stomach)
        
        bodyParts = [arm, foot, head, leg, neck, nose, shoulder, stomach]
        
        // show label: "my ____ hurts"
        // timer delay before calling chooseBodyPart
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
            timer in
        }
        
        chooseBodyPart()
    }
    
    func chooseBodyPart() {
        
       // if(bodyParts.count > 3) {
            index = Int.random(in: 0 ..< bodyParts.count)
            
            // reveal body part, set correct answer
            
            bodyParts[index].isHidden = false
            
            // check answer, if correct,delete body part in temparray and check if array
       // }
        
        /*else {
            done = true
        }*/
        
    }
    
    func checkAnswer(answer: String) -> Bool {
        if correctAnswers[index].contains(answer.lowercased()) {
            bodyParts[index].isHidden = true
            bodyParts.remove(at: index)
            correctAnswers.remove(at: index)
            
            if(bodyParts.count > 3) {
                chooseBodyPart()
            }
            
            else {
                done = true
            }
            
            return true
        }
        else{
            return false
        }
    }
    
    func isDone() -> Bool {
        return self.done
    }
    
    func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.push(with: .left, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
}
