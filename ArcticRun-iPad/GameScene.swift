//
//  GameScene.swift
//  ArcticRun-iPad
//
//  Created by Sam Salvail on 2016-02-18.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import SpriteKit

var bear : SKSpriteNode!
var bearWalkingFrames : [SKTexture]!

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        backgroundColor = (UIColor.blackColor())
        let bearAnimatedAtlas = SKTextureAtlas(named: "BearImages")
        var walkFrames = [SKTexture]()
        
        let numImages = bearAnimatedAtlas.textureNames.count
        for var i=1; i<=numImages/2; i++ {
            let bearTextureName = "bear\(i)"
            walkFrames.append(bearAnimatedAtlas.textureNamed(bearTextureName))
        }
        
        bearWalkingFrames = walkFrames
        
        let firstFrame = bearWalkingFrames[0]
        bear = SKSpriteNode(texture: firstFrame)
        bear.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        addChild(bear)
        
    }
    
    func bearMoveEnded() {
        bear.removeAllActions()
    }
    
    func walkingBear() {
        //This is our general runAction method to make our bear walk.
        bear.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(bearWalkingFrames,
                timePerFrame: 0.1,
                resize: false,
                restore: true)),
            withKey:"walkingInPlaceBear")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 1
        let touch = touches.first
        let location = touch!.locationInNode(self)
        var multiplierForDirection: CGFloat
        
        // 2
        let bearVelocity = self.frame.size.width / 3.0
        
        // 3
        let moveDifference = CGPointMake(location.x - bear.position.x, location.y - bear.position.y)
        let distanceToMove = sqrt(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y)
        
        // 4
        let moveDuration = distanceToMove / bearVelocity
        
        // 5
        if (moveDifference.x < 0) {
            multiplierForDirection = 1.0
        } else {
            multiplierForDirection = -1.0
        }
        
        bear.xScale = fabs(bear.xScale) * multiplierForDirection
        
        // 1
        if (bear.actionForKey("bearMoving") != nil) {
            //stop just the moving to a new location, but leave the walking legs movement running
            bear.removeActionForKey("bearMoving")
        }
        
        // 2
        if (bear.actionForKey("walkingInPlaceBear") == nil) {
            //if legs are not moving go ahead and start them
            walkingBear()
        }
        
        // 3
        let moveAction = (SKAction.moveTo(location, duration:(Double(moveDuration))))
        
        // 4
        let doneAction = (SKAction.runBlock({
            print("Animation Completed")
            self.bearMoveEnded()
        }))
        
        // 5
        let moveActionWithDone = (SKAction.sequence([moveAction, doneAction]))
        bear.runAction(moveActionWithDone, withKey:"bearMoving")
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
