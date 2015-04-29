//
//  GameScene.swift
//  Created by Kyle Weiner on 4/18/15.
//

import SpriteKit

class GameScene: SKScene {

    override func didMoveToView(view: SKView) {
        addBackground()
        addButton()
    }

    func addButton() {
        let button = KWButtonNode(
            imageNamed: "Button Play",
            selectedImageNamed:"Button Play Selected",
            disabledImageNamed: "Button Play Disabled"
        )

        //buttonNode.enabled = false
        button.position = CGPointMake(frame.width/2, frame.height/2)
        addChild(button)

        button.touchDownHandler = {
            println("touchDownHandler handler called.")
        }

        button.touchUpInsideHandler = {
            println("touchUpInsideHandler handler called.")
        }

        button.touchUpHandler = {
            println("touchUpHandler handler called.")
        }
    }

    func addBackground() {
        let background = SKSpriteNode(imageNamed: "Background")
        background.anchorPoint = CGPointMake(0, 0)
        background.blendMode = .Replace
        addChild(background)
    }

}