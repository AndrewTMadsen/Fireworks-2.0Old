//
//  GameScene.swift
//  Fireworks 2.0
//
//  Created by Andrew Madsen on 7/11/18.
//  Copyright © 2018 Andrew Madsen. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene
{
    let booms: [SKEmitterNode?] = [SKEmitterNode(fileNamed: "FireworkExplosion"), SKEmitterNode(fileNamed: "FireworkExplosion2"),SKEmitterNode(fileNamed:"FireworkExplosion3"), SKEmitterNode(fileNamed:  " FireworkExplosion4")]
    var hasSetSize = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            if let particles = self.booms[Int(arc4random_uniform(UInt32(booms.count)))]?.copy() as! SKEmitterNode?
            {
                let point = touch.preciseLocation(in: touch.view)
                particles.position = CGPoint(x: point.x, y: -point.y)
                self.addChild(particles)
            }
        }
    }

    override func update(_ currentTime: TimeInterval)
    {
        if !hasSetSize
        {
            self.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            hasSetSize = true
        }
    }
}
