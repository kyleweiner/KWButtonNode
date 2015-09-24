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
        self.defaultTexture = SKTexture(imageNamed: imageNamed)

        if let name = selectedImageNamed {
            self.selectedTexture = SKTexture(imageNamed: name)
        }

        if let name = disabledImageNamed {
            self.disabledTexture = SKTexture(imageNamed: name)
        }

        super.init(texture: self.defaultTexture, color: .whiteColor(), size: self.defaultTexture.size())

        userInteractionEnabled = true
    }

    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    // MARK: - User Interaction

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !enabled {
            return
        }

        selected = true

        touchDownHandler?()
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !enabled {
            return
        }

        if let touch = touches.first {
            selected = CGRectContainsPoint(frame, touch.locationInNode(parent!)) ? true : false
        }
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !enabled {
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