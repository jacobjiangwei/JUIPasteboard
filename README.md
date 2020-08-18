# Pasteboard
# An easy way to read iOS UIPasteboard including web archive, images, pdf and share image/texts.

[![Version](https://img.shields.io/cocoapods/v/Pasteboard.svg?style=flat)](https://cocoapods.org/pods/Pasteboard)
[![License](https://img.shields.io/cocoapods/l/Pasteboard.svg?style=flat)](https://cocoapods.org/pods/Pasteboard)
[![Platform](https://img.shields.io/cocoapods/p/Pasteboard.svg?style=flat)](https://cocoapods.org/pods/Pasteboard)

## Example



let item = Pasteboard()
item.readPasteboard()
print(item.imageData)

[Pasteboard.PasteImageData(width: 640.0, height: 515.0, type: "image/jpeg", data: 30485 bytes), Pasteboard.PasteImageData(width: 640.0, height: 456.0, type: "image/jpeg", data: 27983 bytes), Pasteboard.PasteImageData(width: 640.0, height: 386.0, type: "image/jpeg", data: 28066 bytes), Pasteboard.PasteImageData(width: 640.0, height: 409.0, type: "image/jpeg", data: 60081 bytes), Pasteboard.PasteImageData(width: 640.0, height: 853.0, type: "image/jpeg", data: 100864 bytes), Pasteboard.PasteImageData(width: 600.0, height: 450.0, type: "image/jpeg", data: 33219 bytes)]

vice versa to write any images/text to pasteboard.

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Pasteboard is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Pasteboard'
```

## Author

Jacob Jiang, kof2003@126.com

## License

Pasteboard is available under the MIT license. See the LICENSE file for more info.
