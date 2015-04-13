//
//  GameScene.swift
//  Travel in Silence
//
//  Created by Steve Clement on 11/04/15.
//  Copyright (c) 2015 Steve Clement. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    let pauseButton = SKSpriteNode(imageNamed: "pause")

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.pauseButton.position = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))
        self.addChild(self.pauseButton)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
