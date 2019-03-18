//
//  L1LessonThree.swift
//  DigipetCapstone
//
//  Created by Cassandra on 2/22/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class L1LessonThree: SKScene {
    var done: Bool!
    
    var Pet1: SKSpriteNode!
    var sBubble1: SKSpriteNode!
    var pet1Text: SKLabelNode!
    //var pet1Text2: SKLabelNode!
    var bread : SKSpriteNode!
    var rice : SKSpriteNode!
    var meat : SKSpriteNode!
    var egg : SKSpriteNode!
    
    var milk : SKSpriteNode!
    var juice : SKSpriteNode!
    var water : SKSpriteNode!
    
    var fruit : SKSpriteNode!
    var veggie : SKSpriteNode!
    var dessert : SKSpriteNode!
    
    var wall : SKSpriteNode!
    var pointer : SKSpriteNode!
    var closedFridge : SKSpriteNode!
    var openFridge : SKSpriteNode!
    
    var walkIn: SKAction!
    var rotateAction: SKAction!
    var pointAction: SKAction!
    var walkOut: SKAction!
    
    var lang : Int = 0
    var foodIndex : Int = 0
    var counter : Int = 0
    //var counter : Int = 9
    
    let petImgs = ["china", "spain", "france"]
    var foodArr : [SKNode] = []
    var foodTextArr : [[String]] = [[]]
    var drinkArr : [SKNode] = []
    var showThisDrink : [Int] = [0, 0, 0]
    var questionTextEnd : [String] = []
    var array : [() -> ()] = []
    var prompts : [[String]] = [["你好!", "我喜欢吃", "你喜欢吃"," 你在超市买什么？", "太好了，谢谢你", "你喜欢喝什么?", "你最喜欢水果，蔬菜，还是甜点?", "好极了! 拜拜"],[],[]]
    var correctAnswers : [[[String]]] = [[[]]]
    
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
        
        array = [sayHello, whatFood, whatFood, whatFood, whatFood, groceryStore, goodBye1, sayHello, whatDrink, whatDrink, whatType, goodBye2]
        
        rotateAction = SKAction.sequence([SKAction.rotate(byAngle: 0.2, duration: 0.5), SKAction.rotate(byAngle: -0.2, duration: 0.5)])
        pointAction = SKAction.repeat((SKAction.sequence([SKAction.moveBy(x: -5, y: 0, duration: 0.5), SKAction.moveBy(x: 5, y: 0, duration: 0.5)])), count: 10)
        walkOut = SKAction.move(to: CGPoint(x: self.frame.size.width * -1, y: self.frame.size.height * -0.4), duration: 2.4)
        let walkInAction: SKAction = SKAction.move(to: CGPoint(x: self.frame.size.width * 0.21, y: self.frame.size.height * -0.165), duration: 4)
        walkIn = SKAction.group([walkInAction, SKAction.repeat(rotateAction, count: 4)])
        
        wall = SKSpriteNode(imageNamed: "wall")
        wall.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        wall.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        wall.zPosition = -1
        wall.position = CGPoint(x: 0, y: 0)
        addChild(wall)
        
        closedFridge = SKSpriteNode(imageNamed: "closedFridge")
        closedFridge.anchorPoint = CGPoint(x: 0, y: 0)
        closedFridge.position = CGPoint(x: self.frame.size.width * -0.65, y: self.frame.size.height * -0.4)
        closedFridge.zPosition = 0
        closedFridge.setScale(0.6)
        addChild(closedFridge)
        
        openFridge = SKSpriteNode(imageNamed: "openFridge")
        openFridge.anchorPoint = CGPoint(x: 0, y: 0)
        openFridge.position = CGPoint(x: self.frame.size.width * -0.65, y: self.frame.size.height * -0.4)
        openFridge.zPosition = 0.5
        openFridge.setScale(0.6)
        openFridge.isHidden = true
        addChild(openFridge)
        
        bread = SKSpriteNode(imageNamed: "bread")
        bread.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bread.position = CGPoint(x: self.frame.size.width * -0.2, y: self.frame.size.height * -0.15)
        bread.zPosition = 2
        bread.setScale(0.15)
        bread.isHidden = true
        addChild(bread)
        
        rice = SKSpriteNode(imageNamed: "rice")
        rice.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        rice.position = CGPoint(x: self.frame.size.width * -0.2, y: self.frame.size.height * -0.15)
        rice.zPosition = 2
        rice.setScale(0.15)
        rice.isHidden = true
        addChild(rice)
        
        meat = SKSpriteNode(imageNamed: "meat")
        meat.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        meat.position = CGPoint(x: self.frame.size.width * -0.2, y: self.frame.size.height * -0.15)
        meat.zPosition = 2
        meat.setScale(0.15)
        meat.isHidden = true
        addChild(meat)
        
        egg = SKSpriteNode(imageNamed: "egg")
        egg.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        egg.position = CGPoint(x: self.frame.size.width * -0.2, y: self.frame.size.height * -0.15)
        egg.zPosition = 2
        egg.setScale(0.15)
        egg.isHidden = true
        addChild(egg)
        
        milk = SKSpriteNode(imageNamed: "milk")
        milk.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        milk.position = CGPoint(x: self.frame.size.width * -0.3, y: self.frame.size.height * -0.15)
        milk.zPosition = 2
        milk.setScale(0.2)
        milk.isHidden = true
        addChild(milk)
        
        juice = SKSpriteNode(imageNamed: "juice")
        juice.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        juice.position = CGPoint(x: self.frame.size.width * -0.3, y: self.frame.size.height * -0.005)
        juice.zPosition = 2
        juice.setScale(0.15)
        juice.isHidden = true
        addChild(juice)
        
        water = SKSpriteNode(imageNamed: "water")
        water.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        water.position = CGPoint(x: self.frame.size.width * -0.3, y: self.frame.size.height * 0.15)
        water.zPosition = 2
        water.setScale(0.15)
        water.isHidden = true
        addChild(water)
        
        fruit = SKSpriteNode(imageNamed: "apple")
        fruit.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        fruit.position = CGPoint(x: self.frame.size.width * -0.25, y: self.frame.size.height * -0.15)
        fruit.zPosition = 2
        fruit.setScale(0.15)
        fruit.isHidden = true
        addChild(fruit)
        
        veggie = SKSpriteNode(imageNamed: "carrot")
        veggie.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        veggie.position = CGPoint(x: self.frame.size.width * -0.3, y: self.frame.size.height * -0.005)
        veggie.zPosition = 2
        veggie.setScale(0.15)
        veggie.isHidden = true
        addChild(veggie)
        
        dessert = SKSpriteNode(imageNamed: "dessert")
        dessert.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        dessert.position = CGPoint(x: self.frame.size.width * -0.35, y: self.frame.size.height * 0.15)
        dessert.zPosition = 2
        dessert.setScale(0.12)
        dessert.isHidden = true
        addChild(dessert)
        
        Pet1 = SKSpriteNode(imageNamed: petImgs[lang])
        Pet1.zPosition = 1
        Pet1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        Pet1.position = CGPoint(x: self.frame.size.width * 0.25, y: self.frame.size.height * -0.25)
        Pet1.setScale(0.15)
        addChild(Pet1)
        
        sBubble1 = SKSpriteNode(imageNamed: "speechbubble")
        sBubble1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sBubble1.size = CGSize(width: self.frame.size.width * 0.75, height: self.frame.size.height * 0.25)
        sBubble1.zPosition = 1
        sBubble1.position = CGPoint(x: self.frame.size.width * 0.03, y: self.frame.size.height * 0.18)
        addChild(sBubble1)
        sBubble1.isHidden = true
        
        pet1Text = SKLabelNode()
        pet1Text.zPosition = 2
        pet1Text.position = CGPoint(x: sBubble1.position.x, y: sBubble1.position.y + (sBubble1.position.y * 0.1))
        pet1Text.fontColor = UIColor.black
        pet1Text.fontName = "Plumpfull"
        pet1Text.fontSize = 30
        addChild(pet1Text)
        //pet1Text.isHidden = true
        
        
        foodArr = [bread, rice, meat, egg]
        foodTextArr = [["面包", "米饭", "肉", "鸡蛋"], [], []]
        drinkArr = [milk, juice, water]
        questionTextEnd = ["吗?", "?", "?"]
        correctAnswers = [[["你好!", "你好", "你好。"], ["我喜欢吃面包", "我喜欢吃面包。", "我不喜欢吃面包", "我不喜欢吃面包。"], ["我喜欢吃米饭", "我喜欢吃米饭。", "我不喜欢吃米饭", "我不喜欢吃米饭。"], ["我喜欢吃肉", "我喜欢吃肉。", "我不喜欢吃肉", "我不喜欢吃肉。"], ["我喜欢吃鸡蛋", "我喜欢吃鸡蛋。", "我不喜欢吃鸡蛋", "我不喜欢吃鸡蛋。"], ["我在超市买食物。", "我在超市买食物"], ["再见！", "再见"], ["你好!", "你好", "你好。"], ["我喜欢喝牛奶", "我喜欢喝水", "我喜欢喝果汁", "我喜欢喝牛奶。", "我喜欢喝水。", "我喜欢喝果汁。"], [""], ["我最喜欢水果", "我最喜欢蔬菜", "我最喜欢甜点", "我最喜欢水果。", "我最喜欢蔬菜。", "我最喜欢甜点。"], ["拜拜", "再见"]],[[]],[[]]]
        
       sayHello()
    }
    
    
    // random foodindex
    // like body parts, counter and delete
    // fade in transition for open fridge
    
    func sayHello() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            timer in
            self.Pet1.run(self.walkIn)
        }
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) {
            timer in
            self.sBubble1.isHidden = false
            self.pet1Text.text = (self.prompts)[self.lang][0]
        }
        
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
            timer in
            self.pet1Text.text = ""
            
        }
    }
    
    func whatFood() {
        
        openFridge.isHidden = false
    
        foodArr[0].isHidden = false
        self.pet1Text.text = prompts[lang][1] + foodTextArr[lang][0]
            
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
                timer in
                self.pet1Text.text = ""
        }
            
        self.pet1Text.text = prompts[lang][2] + foodTextArr[lang][0] + questionTextEnd[lang]
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
            timer in
            self.pet1Text.text = ""
        }
        
    }
    
    func groceryStore() {
        self.pet1Text.text = prompts[lang][3]
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
            timer in
            self.pet1Text.text = ""
        }
    }
    
    func goodBye1() {
        self.pet1Text.text = prompts[lang][4]
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
            timer in
            self.pet1Text.text = ""
        }
        
    }
    
    func whatDrink() {
        Pet1.run(walkIn)
        sBubble1.isHidden = false
        
        if (counter == 8) {
            self.openFridge.isHidden = false
            self.milk.isHidden = false
            self.juice.isHidden = false
            self.water.isHidden = false
        }
        
        else {
            var temp = 0
            
            while (temp < 3) {
                if (showThisDrink[temp] == 1) {
                    drinkArr[temp].isHidden = true
                }
                else {
                    drinkArr[temp].isHidden = false
                }
                
                temp += 1
            }
        }
        
        pet1Text.text = prompts[lang][5]
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
            timer in
            self.pet1Text.text = ""
        }
    }
    
    func whatType() {
        pet1Text.fontSize = 18
        pet1Text.text = prompts[lang][6]
        
        fruit.isHidden = false
        veggie.isHidden = false
        dessert.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 6, repeats: false) {
            timer in
            self.pet1Text.text = ""
            self.pet1Text.fontSize = 30
        }
      
    }
    
    func goodBye2() {
        fruit.isHidden = true
        veggie.isHidden = true
        dessert.isHidden = true
        
        pet1Text.text = prompts[lang][7]
        
        Timer.scheduledTimer(withTimeInterval: 6, repeats: false) {
            timer in
            self.pet1Text.text = ""
        }
    }
    
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    func hasElement(str: String, arr: Array<String>) -> Bool {
        for i in (0...arr.count - 1) {
            if(str.contains(arr[i])) {
                return true
            }
        }
        
        return false
    }
    
    func removeFromCorrectAnswers(str: String) {
        var temp = 0
        var length = correctAnswers[lang][counter].count
        
        while (temp < length) {
            print(correctAnswers[lang][counter])
            if(correctAnswers[lang][counter][temp].contains(str)) {
                correctAnswers[lang][counter].remove(at: temp)
            }
            
            temp += 1
            length = correctAnswers[lang][counter].count
        }
        
        print("should have deleted")
        correctAnswers[lang][counter + 1] = correctAnswers[lang][counter]
    }
    
    func checkAnswer(answer: String) -> Bool {
        
        if correctAnswers[lang][counter].contains(answer.lowercased()) {
            
            if ((foodArr.count > 0) && (counter == 1 || counter == 2 || counter == 3 || counter == 4)) {
                foodArr[0].isHidden = true
                foodArr.removeFirst()
                foodTextArr[lang].removeFirst()
            }
            
            if (counter == 6) {
                Pet1.run(walkOut)
                sBubble1.isHidden = true
                openFridge.isHidden = true
                Timer.scheduledTimer(withTimeInterval: 6, repeats: false) {
                    timer in
                }
            }
            
            if (counter == 8) {
                let milkArr = ["牛奶","leche","le lait"]
                let juiceArr = ["果汁","zumo","le jus"]
                let waterArr = ["水","agua","l’eau"]
                
                if (hasElement(str: answer, arr: milkArr)){
                    showThisDrink[0] = 1
                    removeFromCorrectAnswers(str: milkArr[lang])
                }
                
                else if (hasElement(str: answer, arr: juiceArr)){
                    showThisDrink[1] = 1
                    removeFromCorrectAnswers(str: juiceArr[lang])
                    }
                
                    else { //if (hasElement(str: answer, arr: waterArr) {
                    showThisDrink[2] = 1
                    removeFromCorrectAnswers(str: waterArr[lang])
                    
                    print("got rid of water")
                }
            }
            
            if(counter == 9) {
                juice.isHidden = true
                milk.isHidden = true
                water.isHidden = true
            }
            
            if(counter == array.count - 1) {
                openFridge.isHidden = true
                sBubble1.isHidden = true
                
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
                    timer in
                    self.Pet1.run(self.walkOut)
                }
                
                Timer.scheduledTimer(withTimeInterval: 6, repeats: false) {
                    timer in
                    self.pet1Text.text = ""
                }
            }
            
            nextPrompt()
            return true
        }
        
        return false
    }
    
    func isDone() -> Bool {
        return self.done
    }
    
    func nextPrompt() {
        counter += 1
        if counter < array.count {
            self.array[counter]()
            //self.pointer.isHidden = true
        }
    }
}
