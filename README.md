# KWButtonNode

KWButtonNode is a lightweight subclass of [`SKSpriteNode`](https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKSpriteNode_Ref/index.html#//apple_ref/occ/cl/SKSpriteNode) for easily implementing buttons in SpriteKit.

![KWButtonNode Preview](preview.gif)

## Installation

Simply copy the files in the `KWButtonNode` directory into your project.

## Usage

Try the demo!

1. Using the Media library, drag the default image for the button to the scene.
2. Set its name (e.g. "button") in the Attributes inspector.
3. Set its custom class to `KWButtonNode` in the Custom Class inspector.
4. In the corresponding `SKScene` class file:

```swift
let button = childNodeWithName("button") as! KWButtonNode
button.selectedTexture = SKTexture(imageNamed: "button_play_selected")
button.disabledTexture = SKTexture(imageNamed: "button_play_disabled")
```

Or, simply instantiate the button in code:

```swift
let buttonNode = KWButtonNode(
    imageNamed: "button",
    selectedImageNamed:"button_selected",
    disabledImageNamed: "button_disabled"
)
```

KWButtonNode uses closures for handling touch events.

```swift
buttonNode.touchDownHandler = { button in
    // ...
}

buttonNode.touchUpHandler = { button in
    // ...
}

buttonNode.touchUpInsideHandler = { button in
    // ...
}

buttonNode.touchesMovedHandler = { button in
    // ...
}

buttonNode.touchesCancelledHandler = { button in
    // ...
}
``` 

KWButtonNode instances can be disabled using the `enabled` property.

```swift
buttonNode.enabled = false
``` 

## Author

KWButtonNode was written by Kyle Weiner.

## License

KWButtonNode is available under the MIT license. See the LICENSE file for details.
