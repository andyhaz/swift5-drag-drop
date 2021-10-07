//
//  GameViewController.swift
//  swift5-SpritKit-template
//
//  Created by andyhaz on 10/5/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        skView.ignoresSiblingOrder = true
            
        skView.showsFPS = true
        skView.showsNodeCount = true
    }
}
