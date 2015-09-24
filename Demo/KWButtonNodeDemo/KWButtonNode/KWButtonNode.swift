//
//  KWButtonNode.swift
//  Created by Kyle Weiner on 4/13/15.
//

import UIKit
import SpriteKit

class KWButtonNode: SKSpriteNode {

    var defaultTexture: SKTexture
    var selectedTexture: SKTexture?
    var disabledTexture: SKTexture?

    var enabled = true {
        didSet {
            if disabledTexture != nil {
                texture = enabled ? defaultTexture : disabledTexture
            }
        }
    }

    var selected = false {
        didSet {
            texture = selected ? selectedTexture : defaultTexture
        }
    }

    var touchDownHandler: (() -> ())?
    var touchUpHandler: (() -> ())?
    var touchUpInsideHandler: (() -> ())?

    // MARK: - Lifecycle

    init(imageNamed: String, selectedImageNamed: String?, disabledImageNamed: String?) {
        defaultTexture = SKTexture(imageNamed: imageNamed)

        if selectedImageNamed != nil {
            selectedTexture = SKTexture(imageNamed: selectedImageNamed!)
        }

        if disabledImageNamed != nil {
            disabledTexture = SKTexture(imageNamed: disabledImageNamed!)
        }

        super.init(texture: defaultTexture, color: .clearColor(), size: defaultTexture.size())

        userInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    // MARK: - User Interaction

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard enabled else {
            return
        }

        selected = true

        touchDownHandler?()
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard enabled else {
            return
        }

        if let touch = touches.first {
            selected = CGRectContainsPoint(frame, touch.locationInNode(parent!))
        }
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard enabled else {
            return
        }

        selected = false

        if let touch = touches.first {
            if CGRectContainsPoint(frame, touch.locationInNode(parent!)) {
                touchUpInsideHandler?()
            }
        }
        
        touchUpHandler?()
    }
    
}