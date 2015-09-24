//
//  GameViewController.swift
//  Created by Kyle Weiner on 4/18/15.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed:"GameScene") {
            scene.scaleMode = .AspectFill
            scene.blendMode = .Replace

            let skView = view as! SKView

            #if DEBUG
                skView.showsFPS = true
                skView.showsDrawCount = true
                skView.showsNodeCount = true
                skView.showsPhysics = true
            #endif

            skView.ignoresSiblingOrder = true
            skView.presentScene(scene)
        }
    }
    
}
