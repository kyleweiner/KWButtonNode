//
//  GameScene.swift
//  Created by Kyle Weiner on 4/18/15.
//

import SpriteKit

class GameScene: SKScene {

    override func didMoveToView(view: SKView) {
        addButton()
    }

    func addButton() {
        let button = KWButtonNode(
            imageNamed: "Button Play",
            selectedImageNamed:"Button Play Selected",
            disabledImageNamed: "Button Play Disabled"
        )

        button.position = CGPointMake(frame.width/2, frame.height/2)
        self.addChild(button)

        button.touchDownHandler = {
            print("touchDownHandler handler called.")
        }

        button.touchUpInsideHandler = {
            print("touchUpInsideHandler handler called.")
        }

        button.touchUpHandler = {
            print("touchUpHandler handler called.")
        }
    }

}