//
//  L1GameOne.swift
//  DigipetCapstone
//
//  Created by Loaner on 12/7/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class L1GameOne : SKScene {
    
    var done: Bool!
    var pet: SKSpriteNode!
    var ground: SKSpriteNode!
    var stones: SKSpriteNode!
    
    // if successful user input, moves to these points
    var point1: CGPoint!
    var point2: CGPoint!
    var point3: CGPoint!
    var point4: CGPoint!
    var point5: CGPoint!
    var point6: CGPoint!
    
    var pointArr: [CGPoint] = []
    var pointArrIndex: Int = 0
    
    var correctAnswers: [[String]] = [[]]
    
    
    var rotateAction: SKAction!
    //var walkAction: SKAction!
    
    // user input
    //var speechTextBox: SKSpriteNode!
    
    // app response
    // var resultText: SKSpriteNode!
    
    let petImgs = ["china", "spain", "france"]
    
    var lang: Int = 0
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.green
        
        
    /*MinigameCongrats.completionHandler = { */
        
        
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
        
        pet = SKSpriteNode(imageNamed:
            //petImgs[lang])
            "china")
        pet.size = CGSize(width: self.frame.size.width * 0.1773, height: self.frame.size.height * 0.12255)
        pet.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pet.position = CGPoint(x: self.frame.size.width * -0.35, y: self.frame.size.height * -0.425)
        pet.zPosition = 1
        addChild(pet)
        
        
        point1 = CGPoint(x: self.frame.size.width * 0.20, y: self.frame.size.height * -0.425)
        point2 = CGPoint(x: self.frame.size.width * 0.20, y: self.frame.size.height * -0.12)
        point3 = CGPoint(x: self.frame.size.width * -0.20, y: self.frame.size.height * -0.12)
        point4 = CGPoint(x: self.frame.size.width * -0.20, y: self.frame.size.height * 0.16)
        point5 = CGPoint(x: self.frame.size.width * 0.15, y: self.frame.size.height * 0.16)
        point6 = CGPoint(x: self.frame.size.width * 0.15, y: self.frame.size.height * 0.30)
        
        pointArr = [point1, point2, point3, point4, point5, point6]
        
      /*  ground = SKSpriteNode(imageNamed: "mazeBackground")
        ground.size = CGSize(width: self.frame.size.width, height: self.frame.size.height) */
        
        stones = SKSpriteNode(imageNamed: "mazeStones")
        stones.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        addChild(stones)
        
        // define rotateAction
        rotateAction = SKAction.sequence([SKAction.rotate(byAngle: 0.2, duration: 1), SKAction.rotate(byAngle: -0.2, duration: 1)])
        
        correctAnswers = [["往右边走两步。", "往右面走两步。"], ["往前边走两步。", "往前面走两步。"], ["往左边走两步。", "往左面走两步。"], ["往前边走三步。", "往前面走三步。"], ["往右边走两步。", "往右面走两步。"], ["往前边走一步。", "往前面走一步。"]]
        

        // print("fileDest: " + self.fileDest)
        
    }
    
    // prob unecessary
    func startMaze() {
        print("guide me through the maze")
        
        
    }
    
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        return (NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String)
    }
    
    func moveToNextPoint() {
        let walkInAction: SKAction = SKAction.move(to: pointArr[pointArrIndex], duration: 3)
        let walkIn: SKAction = SKAction.group([walkInAction, SKAction.repeat(rotateAction, count: 3)])
        
      /*
 Timer.scheduledTimer(withTimeInterval: 5, repeats: false) {
            timer in
 */
            
            self.pet.run(walkIn)
            self.pointArrIndex += 1
        
        print(pointArrIndex)
 
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
            timer in
        }
            if self.pointArrIndex == self.pointArr.count {
                /*self.pet.run(walkIn)
                self.pointArrIndex += 1
                
                print("keep going") */
                self.done = true
            }
            /*else {
                self.done = true
            }*/
        // }
        
        }
    
    func checkAnswer(answer: String) -> Bool {
        print("\ncorrect answer: ", correctAnswers[pointArrIndex])
        print("answer lowercased: ", answer.lowercased())
        if correctAnswers[pointArrIndex].contains(answer.lowercased()) {
            moveToNextPoint()
            return true
        }
        else {
        print("can't go there...try again")
        return false
        }
    }
    
    func isDone() -> Bool {
        // return true
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
