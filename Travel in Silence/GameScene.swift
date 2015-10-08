//
//  GameScene.swift
//  Travel in Silence
//
//  Created by Steve Clement on 11/04/15.
//  Copyright (c) 2015 Steve Clement. All rights reserved.
//

import SpriteKit
import Foundation

class GameScene: SKScene {

    let pauseButton = SKSpriteNode(imageNamed: "pause")
    let delayLabel = SKLabelNode(fontNamed: "MyriadPro-Regular")
    let scoreLabel = SKLabelNode(fontNamed: "MyriadPro-Regular")
    let versionLabel = SKLabelNode(fontNamed: "MyriadPro-Regular")
    
    override func didMoveToView(view: SKView) {

        // Delay of the train in seconds
        let delay = 300
        
        // This is a game, hence the need of a score variable
        let score = 31337
        
        // declare the score as an NSNumber so we know it is a number
        let scoreNSNumber = score as NSNumber

        // align labels
        delayLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right

        delayLabel.position = CGPoint(x:300.0, y:CGRectGetMaxY(self.frame) - delayLabel.fontSize)
        scoreLabel.position = CGPoint(x:720.0, y:CGRectGetMaxY(self.frame) - delayLabel.fontSize)
        pauseButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-64/2)
        // MaxX: 1024 Width: 1024
        // MaxY: 768  Height: 768
        //delayLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        //delayLabel.position = CGPoint(x:512.0, y:384)

        // Fill labels with text and set font sizes
        delayLabel.text = "Delay: \(delay/60) min"
        scoreLabel.text = scoreNSNumber.stringValue
        
        delayLabel.fontSize = 23
        scoreLabel.fontSize = 23
        

        if debug {
            NSLog("just about to draw da button")
            NSLog("\(CGRectGetMinX(self.frame))")
            NSLog("\(CGRectGetMaxY(self.frame))")
        }
        
        self.addChild(pauseButton)
        self.addChild(delayLabel)
        self.addChild(scoreLabel)

        if debug {
            versionLabel.text = "\(shortVersionString)"
            versionLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
            versionLabel.fontSize = 42
            self.addChild(versionLabel)
    }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */

        for touch in (touches ) {
            
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"play")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
            
        }

    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if pauseButton.containsPoint(location) {
                NSLog("pause!")
            }
        }
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
