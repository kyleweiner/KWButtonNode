//
//  GameScene.swift
//  Created by Kyle Weiner on 4/18/15.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        configureButton()
    }

    func configureButton() {
        let button = childNodeWithName("world/button") as! KWButtonNode
        button.selectedTexture = SKTexture(imageNamed: "button_play_selected")
        button.disabledTexture = SKTexture(imageNamed: "button_play_disabled")

        button.touchDownHandler = { button in
            print("touchDownHandler handler called.")
        }

        button.touchUpInsideHandler = { button in
            print("touchUpInsideHandler handler called.")
        }

        button.touchUpHandler = { button in
            print("touchUpHandler handler called.")
        }
    }
}