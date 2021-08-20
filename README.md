# BottomSheetDialog

[![CI Status](https://img.shields.io/travis/wanderingfairy/BottomSheetDialog.svg?style=flat)](https://travis-ci.org/wanderingfairy/BottomSheetDialog)
[![Version](https://img.shields.io/cocoapods/v/BottomSheetDialog.svg?style=flat)](https://cocoapods.org/pods/BottomSheetDialog)
[![License](https://img.shields.io/cocoapods/l/BottomSheetDialog.svg?style=flat)](https://cocoapods.org/pods/BottomSheetDialog)
[![Platform](https://img.shields.io/cocoapods/p/BottomSheetDialog.svg?style=flat)](https://cocoapods.org/pods/BottomSheetDialog)

| <img src="https://i.loli.net/2021/08/21/eXuUfKL9lxwOBTv.png" alt="simulator_screenshot_E561520E-8430-4B33-BA3E-CAFC2CB28C12"  /> | ![simulator_screenshot_FE64B750-971C-47E6-A1F5-776FDE8C275E](https://i.loli.net/2021/08/21/195numIZYWARlCM.png) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |



## A library for using the bottom sheet dialog in iOS.

- [x] AutoLayout is supported.
- [x] You can apply cornerRadius to Sheet.
- [x] There are many customizable attributes.
- [x] Handling did Tap event using delegate.
- [x] Easy and simple to use.



## Usage

### 1. init and set delegate

```swift
let sheet = BottomDialogView(titles: ["delete",
                                          "cancel"],
                             images: [UIImage(named: "trash")!
                                            .withRenderingMode(.alwaysOriginal),
                                      UIImage(named: "xmark")!
                                            .withRenderingMode(.alwaysOriginal)])
    sheet.delegate = self
```



### 2. Set Attributes

```swift
    sheet.titleFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    sheet.sheetHeight = 56
    sheet.imageSize = CGSize(width: 30, height: 30)
    sheet.removeFromSuperviewWhenDidTap = true // default value is false
    sheet.sheetCornerRadius = 14
    sheet.sheetBottomPadding = view.safeAreaInsets.bottom
    sheet.sheetBorderWidth = 0.5
    sheet.sheetBorderColor = .gray
```



Here are all of the customizable attributes and their default values:

```swift
var sheetCornerRadius: CGFloat = 0
var sheetCornerRadiusOnlyTop = false
var sheetBorderWidth: CGFloat = 0
var sheetBorderColor: UIColor = .lightGray
var sheetHeight: CGFloat = 56
var sheetPadding: CGFloat = 0
var imageLeadingPadding: CGFloat = 16
var titleLeadingPadding: CGFloat = 20
var titleColor: UIColor = .black
var titleFont: UIFont = .systemFont(ofSize: 14, weight: .bold)
var titleAlignment: NSTextAlignment = .natural
var viewBackgroundColor: UIColor? = .black.withAlphaComponent(0.7)
var sheetBackgroundColor: UIColor = .white
var removeFromSuperviewWhenDidTap = false
var sheetBottomPadding: CGFloat = 0
lazy var imageSize: CGSize = CGSize(width: 28, height: 28)
```

But you can use the default settings without specifying anything.



### 3. Add subview and show()

```swift
view.addSubview(sheet)
sheet.show()
```



### 4. Event handling with delegate method

```swift
extension ViewController: BottomDialogDelegate { 
  func didTapSheet(title: String, tag: Int) {
    switch title {
    case "delete":
      print("delete")
    default:
      print(title)
    }
  }
}
```

If the `removeFromSuperviewWhenDidTap` setting is not set to `true`, you must manually call `removeFromSuperview()`.



## Requirements

```swift
iOS version >= 11.0
Swift version >= 5.0
```



## Installation

BottomSheetDialog is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BottomSheetDialog'
```

## Author

wanderingfairy, iospandaman@gmail.com

## License

BottomSheetDialog is available under the MIT license. See the LICENSE file for more info.

