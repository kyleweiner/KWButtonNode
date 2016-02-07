//
//  KWButtonNode.swift
//  Created by Kyle Weiner on 4/13/15.
//

import SpriteKit

class KWButtonNode: SKSpriteNode {
    var defaultTexture: SKTexture?
    var selectedTexture: SKTexture?
    var disabledTexture: SKTexture?

    var touchDownHandler: (KWButtonNode -> Void)?
    var touchUpHandler: (KWButtonNode -> Void)?
    var touchUpInsideHandler: (KWButtonNode -> Void)?
    var touchesMovedHandler: (KWButtonNode -> Void)?
    var touchesCancelledHandler: (KWButtonNode -> Void)?

    var enabled = true {
        didSet {
            if disabledTexture != nil {
                texture = enabled ? defaultTexture : disabledTexture
            }
        }
    }

    var selected = false {
        didSet {
            if selectedTexture != nil {
                texture = selected ? selectedTexture : defaultTexture
            }
        }
    }

    init(imageNamed: String, selectedImageNamed: String? = nil, disabledImageNamed: String? = nil) {
        defaultTexture = SKTexture(imageNamed: imageNamed)

        if let selectedImageNamed = selectedImageNamed {
            selectedTexture = SKTexture(imageNamed: selectedImageNamed)
        }

        if let disabledImageNamed = disabledImageNamed {
            disabledTexture = SKTexture(imageNamed: disabledImageNamed)
        }

        super.init(texture: defaultTexture, color: .clearColor(), size: defaultTexture!.size())

        userInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        defaultTexture = texture
        userInteractionEnabled = true
    }

    // MARK: - User Interaction

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard enabled else { return }

        super.touchesBegan(touches, withEvent: event)

        selected = true
        touchDownHandler?(self)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard enabled else { return }

        super.touchesMoved(touches, withEvent: event)

        if let touch = touches.first {
            selected = CGRectContainsPoint(frame, touch.locationInNode(parent!))
        }

        touchesMovedHandler?(self)
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard enabled else { return }

        super.touchesEnded(touches, withEvent: event)

        if let touch = touches.first {
            if CGRectContainsPoint(frame, touch.locationInNode(parent!)) {
                touchUpInsideHandler?(self)
            }
        }

        selected = false
        touchUpHandler?(self)
    }

    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        super.touchesCancelled(touches, withEvent: event)
        
        touchesCancelledHandler?(self)
    }
}