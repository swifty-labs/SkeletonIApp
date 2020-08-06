
<p>
  <img src="https://avatars0.githubusercontent.com/u/67895642?s=400&u=4e7fe101556e810c541efa77b891de9e5b5d4642&v=4" width="100" height="100">
  <h1>SLEssentials</h1>
</p>

[![CI Status](https://img.shields.io/travis/vukasin-popovic/SLEssentials.svg?style=flat)](https://travis-ci.org/vukasin-popovic/SLEssentials)
[![Version](https://img.shields.io/cocoapods/v/SLEssentials.svg?style=flat)](https://cocoapods.org/pods/SLEssentials)
[![License](https://img.shields.io/cocoapods/l/SLEssentials.svg?style=flat)](https://cocoapods.org/pods/SLEssentials)
[![Platform](https://img.shields.io/cocoapods/p/SLEssentials.svg?style=flat)](https://cocoapods.org/pods/SLEssentials)

**SLEssentials** is set of Swift utilities. It contains most of Swift stuff that have found a purpose in almost all iOS applications.

## Modules

- [NibHelper](https://github.com/swifty-labs/SLEssentials#nib_helper)
- [KeyboardContentManager](https://github.com/swifty-labs/SLEssentials#keyboard_content_manager)
- [UIViewControllerEmbeding](https://github.com/swifty-labs/SLEssentials#controller_embeding)

## Requirements

- iOS 10.0+
- XCode 11+
- Swift 5.0+

## Installation

To integrate **SLEssentials** into your Xcode project, specify it in your Podfile:

```ruby
platform :ios, '10.0'
pod 'SLEssentials', :git => 'https://github.com/swifty-labs/SLEssentials.git'
```
### Subspecs

There are multi subspecs available, like *NibHelper, KeyboardContentManager, UIViewControllerEmbeding* and others. It means, you can install one or more of the **SLEssentials** modules. By default, you get all modules, so, if you need specific module you must specify it.

Podfile example:
```ruby
platform :ios, '10.0'
pod 'SLEssentials/NibHelper', :git => 'https://github.com/swifty-labs/SLEssentials.git'
```
<div id ="nib_helper"></div>

## NibHelper

*NibHelper* is based on UIView, UIViewController, UICollectionViewCell and UITableViewCell extensions. It is used for quick and easy views and cells instantiation.
UICollectionViewCell and UITableViewCell extensions have a similar implementation.

```swift
import SLEssentials

tableView.registerNib(TableCell.self)
let cell: TableCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
```

To create initial UIViewController instance using UIStoryboard:

```swift
import SLEssentials

let controller = UINavigationController.initial() // it is implies that storyboard is Main 

let controller =  UINavigationController.initial(fromStoryboardNamed: "Login") // for specified storyboard
```
To create UIViewController instance using UIStoryboard:

```swift
import SLEssentials

let controller = SignUpController.instantiate(fromStoryboardNamed: "Login")
```

To create UIVew instance, first, your custom UIView have to implement ViewLoadable protocol

```swift
import SLEssentials

final class ImageOverlay: UIView, ViewLoadable {
  ...
}
```
and now you can instatiate it:

```swift
let overlay = ImageOverlay.instance 
```
<div id="keyboard_content_manager"></div>

## KeyboardContentManager

*KeyboardContentManager* modul contains actually two managers, ConstraintKeyboardContentManager and ScrollViewKeyboardContentManager, both implementing KeyboardManageable protocol. It purpose is to handle keyboard, in UIScrollView, when we use ScrollViewKeyboardContentManager, manipulating with content inset, and in UIView, when we use ConstraintKeyboardContentManager, maniputaing with view's bottom constraint.

All we need to do is to register and unregister keyborad notifications:

```swift
import SLEssentials

override func viewWillAppear(_ animated: Bool) {
	super.viewWillAppear(animated)
		
	keyboardManager.registerForKeyboardNotifications()
}
	
override func viewWillDisappear(_ animated: Bool) {
	super.viewWillDisappear(animated)
		
	keyboardManager.unregisterForKeyboardNotifications()
} 
```
Additional implementation is to use some of two manager's handlers:

```swift
keyboardManager.keyboardHides{ 
   ...
}

keyboardManager.keyboardShows {
   ...
}
```

<div id="controller_embeding"></div>

## UIViewControllerEmbeding

*UIViewControllerEmbeding* is modul based on simple UIViewController extension and it's used for embeding UIViewController into UIView using constraints, or specifying controller's frame. User can unembed UIViewController also.

```swift
import SLEssentials

@IBOutlet weak var viewContainer: UIView!
 
 ...
 
let controller = UIViewController() 

embed(viewController: controller, in: viewContainer)

embed(viewController: controller, withFrame: viewContainer.frame, in: viewContainer)

controller.unembed()
```

## Author

vukasin-popovic, vukasin.popovic@swiftylabs.io

## License

SLEssentials is available under the MIT license. [See the LICENSE](https://github.com/swifty-labs/SLEssentials/blob/master/LICENSE) file for more info.
