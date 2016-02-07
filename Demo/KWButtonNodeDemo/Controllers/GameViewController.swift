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

        let skview = view as! SKView
        skview.ignoresSiblingOrder = true
        skview.multipleTouchEnabled = true

        if let scene = GameScene(fileNamed: "GameScene") {
            scene.scaleMode = .AspectFill
            scene.blendMode = .Replace
            skview.presentScene(scene)
        }

        #if DEBUG
            skview.showsFPS = true
            skview.showsDrawCount = true
            skview.showsNodeCount = true
        #endif
    }
}