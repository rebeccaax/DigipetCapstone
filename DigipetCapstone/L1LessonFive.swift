//
//  L1LessonFive.swift
//  DigipetCapstone
//
//  Created by Tony Burger on 4/19/20.
//  Copyright © 2020 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class L1LessonFive: SKScene {
    var done: Bool!
    var Pet1: SKSpriteNode!
    var Pet2: SKSpriteNode!
    var sBubble1: SKSpriteNode!
    var sBubble2: SKSpriteNode!
    var pet1Text: SKLabelNode!
    var pet2Text: SKLabelNode!
    
    var headerText: SKLabelNode!
    
    var array: [() -> ()] = []
    var correctAnswers: [[[String]]] = [[]]
    var counter: Int = 0
    
    var lang: Int = 0
    
    var rotateAction: SKAction!
    var pointAction: SKAction!
    var walkInAction2: SKAction!
    var walkIn2: SKAction!
    var walkOut: SKAction!
    
    let petImgs = ["china", "spain", "france"]
    
    // pet's text to converse with user
    var prompts: [[String]] = [[], [], []]
    
    override func didMove(to view: SKView) {
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
        done = false
        
        // todo base on lines 67-162 of L1LessonOne.swift
        
    }
    
}
