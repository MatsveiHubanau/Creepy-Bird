//
//  GameScene.swift
//  testinggame
//
//  Created by Admin on 31.12.22.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    
    var bgNode:SKNode!
    var birdNode:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        bgNode = self.childNode(withName: "bgNode")
        birdNode = self.childNode(withName: "bird") as? SKSpriteNode
        let movingBG = SKAction.move(by: CGVector(dx: -3000, dy: 0),
                                     duration: 60)
        bgNode.run(movingBG)
        self.physicsWorld.contactDelegate = self
       // DispatchQueue.main.asyncAfter(deadline: .now() + 3,
           //                           execute: movingBG) {
         //   print ("")
       // }
        }
    
  
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        birdNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 40))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        gameEnded ()
    }
    
    func gameEnded () {
        bgNode.removeAllActions()
        birdNode.physicsBody?.pinned = true
    }
}

extension GameScene: SKPhysicsContactDelegate {
    
}
