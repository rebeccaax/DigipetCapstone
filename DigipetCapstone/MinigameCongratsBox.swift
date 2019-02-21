//
//  MinigameCongratsBox.swift
//  DigipetCapstone
//
//  Created by Loaner on 1/10/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import UIKit

public class MinigameCongratsBox: SKShapeNode {
    
    var minigameName: SKLabelNode!
    var line1: SKLabelNode!
    var line2: SKLabelNode!
    var line3: SKLabelNode!
    var line4: SKLabelNode!
    var homeButton : SKShapeNode!
    var homeText : SKLabelNode!
    var againButton : SKShapeNode!
    var againText : SKLabelNode!
    
    public init(lN : String, l1: String, l2: String, l3: String, l4: String){
        
        super.init()
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 550))
        self.path = CGPath(roundedRect: rect, cornerWidth: 10, cornerHeight: 10, transform: nil)
        self.strokeColor = .black
        self.glowWidth = 0
        self.lineWidth = 8.0
        
        minigameName = SKLabelNode(text: lN)
        minigameName.fontName = "Plumpfull"
        minigameName.fontColor = .black
        minigameName.fontSize = 78
        minigameName.horizontalAlignmentMode = .center
        minigameName.position = CGPoint(x: 300, y: 315)
        self.addChild(minigameName)
        
        line1 = SKLabelNode(text: l1)
        line1.fontName = "Plumpfull"
        line1.fontColor = .black
        line1.fontSize = 30
        line1.horizontalAlignmentMode = .center
        
        line2 = SKLabelNode(text: l2)
        line2.fontName = "Plumpfull"
        line2.fontColor = .black
        line2.fontSize = 30
        line2.horizontalAlignmentMode = .center
        
        line3 = SKLabelNode(text: l3)
        line3.fontName = "Plumpfull"
        line3.fontColor = .black
        line3.fontSize = 30
        line3.horizontalAlignmentMode = .center
        
        line4 = SKLabelNode(text: l4)
        line4.fontName = "Plumpfull"
        line4.fontColor = .black
        line4.fontSize = 30
        line4.horizontalAlignmentMode = .center
        
        line1.position = CGPoint(x: 300, y: 280)
        self.addChild(line1)
        line2.position = CGPoint(x: 300, y: 240)
        self.addChild(line2)
        line3.position = CGPoint(x: 300, y: 200)
        self.addChild(line3)
        line4.position = CGPoint(x: 300, y: 160)
        self.addChild(line4)
        
        let qText = SKLabelNode(text: "Play again or try a different game?")
        qText.fontName = "Plumpfull"
        qText.fontColor = .black
        qText.fontSize = 36
        qText.horizontalAlignmentMode = .center
        qText.position = CGPoint(x:300, y:125)
        self.addChild(qText)
        
        homeButton = SKShapeNode(rect: CGRect(x: 80, y: 50, width: 200, height: 50), cornerRadius: 25)
        homeButton.fillColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        homeButton.strokeColor = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1)
        homeButton.lineWidth = 4.0
        homeButton.glowWidth = 0
        
        homeText = SKLabelNode(text: "play a different game")
        homeText.position = CGPoint(x: 180, y: 60)
        homeText.horizontalAlignmentMode = .center
        homeText.fontName = "Plumpfull"
        homeText.fontSize = 36
        homeText.fontColor = .black
        
        self.addChild(homeButton)
        self.addChild(homeText)
        
        
        againButton = SKShapeNode(rect: CGRect(x: 320, y: 50, width: 200, height: 50), cornerRadius: 25)
        againButton.fillColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        againButton.strokeColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
        againButton.lineWidth = 4.0
        againButton.glowWidth = 0
        
        againText = SKLabelNode(text: "play again")
        againText.position = CGPoint(x: 420, y: 60)
        againText.horizontalAlignmentMode = .center
        againText.fontName = "Plumpfull"
        againText.fontSize = 36
        againText.fontColor = .black
        
        self.addChild(againButton)
        self.addChild(againText)
        
        
    }
    
    //xcode told me to do this
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
