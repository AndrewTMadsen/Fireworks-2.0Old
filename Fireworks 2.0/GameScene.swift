//
//  GameScene.swift
//  Fireworks 2.0
//
//  Created by Andrew Madsen on 7/11/18.
//  Copyright © 2018 Andrew Madsen. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    var booms: [SKEmitterNode] = [SKEmitterNode(fileNamed: "FireworkExplosion")!, SKEmitterNode(fileNamed: "FireworkExplosion2")!, SKEmitterNode(fileNamed:"FireworkExplosion3")!, SKEmitterNode(fileNamed: "FireworkExplosion4")!]
    
    var hasSetSize = false
    var particles = [UITouch: SKEmitterNode]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fireFirework(at: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        fireFirework(at: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeTouches(touches)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeTouches(touches)
    }
    
    func removeTouches(_ touches: Set<UITouch>) {
        for touch in touches {
        particles[touch] = nil
        }
    }
    
    func getParticle(_ touch: UITouch) -> SKEmitterNode? {
        if let particle = particles[touch] {
            return particle.copy() as? SKEmitterNode
        } else {
            
            let randomNumber = Int(arc4random_uniform(UInt32(booms.count)))
            if let particle = self.booms[randomNumber].copy() as? SKEmitterNode
            {
                particles[touch] = particle
                return particle
            } else {
                return nil
            }
        }
    }
    func fireFirework(at touches: Set<UITouch>) {
        for touch in touches
        {
            if let particle = getParticle(touch) {
                
                let point = touch.preciseLocation(in: touch.view)
                particle.position = CGPoint(x: point.x, y: -point.y)
                self.addChild(particle)
            } else {
                print("No Particle Found")
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
