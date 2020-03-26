//
//  ParticlesView.swift
//  WeatherApp
//
//  Created by onyx on 26.03.2020.
//  Copyright © 2020 Alex Al. All rights reserved.
//

import UIKit
import SpriteKit

class ParticlesView: SKView {
    override func didMoveToSuperview() {
        
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = .clear
        self.presentScene(scene)
        
//        self.allowsTransparency = true
        self.backgroundColor = .clear
        
        if let particles = SKEmitterNode(fileNamed: "ParticleScene.sks") {
            particles.position = CGPoint(x: self.frame.size.width / 2 , y: self.frame.height)
            particles.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(particles)
        }
    }

}
