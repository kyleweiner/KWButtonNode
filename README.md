# KWButtonNode

KWButtonNode is a lightweight subclass of [`SKSpriteNode`](https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKSpriteNode_Ref/index.html#//apple_ref/occ/cl/SKSpriteNode) for easily implementing buttons in SpriteKit.

![KWButtonNode Preview](preview.gif)

## Installation

Simply copy the files in the `KWButtonNode` directory into your project.

## Usage

Try the demo!

```swift
let buttonNode = KWButtonNode(
    imageNamed: "Button",
    selectedImageNamed:"Button Selected",
    disabledImageNamed: "Button Disabled"
)
```

KWButtonNode uses closures for handling touch events.

```swift
buttonNode.touchDownHandler = {
    // ...
}

buttonNode.touchUpInsideHandler = {
    // ...
}

buttonNode.touchUpHandler = {
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
