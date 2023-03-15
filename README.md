# FlowerCocoa

[![CI Status](https://img.shields.io/travis/marst123/FlowerCocoa.svg?style=flat)](https://travis-ci.org/marst123/FlowerCocoa)
[![Version](https://img.shields.io/cocoapods/v/FlowerCocoa.svg?style=flat)](https://cocoapods.org/pods/FlowerCocoa)
[![License](https://img.shields.io/cocoapods/l/FlowerCocoa.svg?style=flat)](https://cocoapods.org/pods/FlowerCocoa)
[![Platform](https://img.shields.io/cocoapods/p/FlowerCocoa.svg?style=flat)](https://cocoapods.org/pods/FlowerCocoa)



FlowerCocoa is a set of UIKit-based control libraries that I independently encapsulate with reference to Rx's notation, and its core relies on link.

## Design idea

Before the design, I always think that the syntax and freedom at the code level is the initial design idea. Swift provides me with such convenience, and I need to make it more convenient.

```
<!--original-->

let label = UILabel()
label.text = name
label.textColor = color
```

```
<!--chain-->

let label = UILabel().text(name).textColor(color)
```

Using chain, you don't need to regenerate the current object for setting the attribute. Although we know who this object is, it is clearly simplified, but it is not perfect.

This is my original idea. I just want to start the UI through the chain call and define the attributes to make things simple. Then I realized that in practice, I still need them to communicate with each other.
Therefore, the most important thing is to insert other attributes with the `link ''. Through a generic "link" layer, I can define new characters within the range allowed by nsobject without being restrained by which role (reference, RX).

It is like a multifunctional plug that can be compatible with different characteristics of different brands, but it also has the same characteristics, reminding me not only for UIKIT, but even the CA and Quartzcore frameworks.

This is a very simple library that makes the UI definition as simple as possible. In any case, this is simple, and this is enough.

## Features

- [x] Based on `link` access to UI, support custom expansion.
- [x] Extensions for UIKit `UIAlertController`， `UICollectionView`， `UITableView`，`UIControl`， ` UIButton`， `UILabel`，`UIStackView`， `UIView`，`UIBezierPath` more..
- [x] Extensions for Quartzcore  `CAGradientLayer`，`CAShapeLayer`，`CATextLayer`
- [x] One line of code sets the font, color and image.
- [x] Simple gesture operation.
- [x] Compiling rich text is more user-friendly.
- [x] Clean code separation.
- [x] Special Label: GradientLayerlabel，InsetLabel，TextLayerLabel
- [x] High playability😜

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS9.0+

## Installation

FlowerCocoa is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FlowerCocoa'
```

## Method Chaining

**You need to evoke it:** 

```
lazy var flower_View: UIView = {
	return UIView().link
		.bgColor(.white)
		.isUserInteractionEnabled(true)
		.base
}()
```



**For a better experience, you need:**

```
#	UILabel
lazy var flower_label: UILabel = {
	return UILabel().link
		.text("FlowerCocoa")
		.titleColor(.hex("#000000"))
		.font(.regular(12))
		.lines(0)
		.alignment(.justified)
		.base
}()

#	UIButton
lazy var flower_button: UIButton = {
	return UIButton().link
		.stateNormal({$0.title("FlowerCocoa")})
		.isEnabled(true)
		.setTag(tag: 10000)
		.base
}()

#	UIStackView
lazy var flower_Cocoa: UIStackView = {
	return UIStackView().link
		.config(.horizontal, alignment: .fill, distribution: .fill, spacing: 0)
		.arranged([flower_label, flower_button])
		.base
}()

#	UICollectionView
lazy var flower_collectionView: UICollectionView = {
	let layout = UICollectionViewFlowLayout().link
		.scrollDirection(.vertical)
		.itemSize(.zero)
		.base
        
	return UICollectionView(frame: .zero, collectionViewLayout: layout).link
		.isScrollEnabled(false)
		.showsVerticalScrollIndicator(false)
		.showsHorizontalScrollIndicator(false)
		.base
}()
```



**You can also use it this way：**

```
var flower_block: BlockHandler<Bool>?
var flower_nullblock: NullHandler?

UIcolor.hex("#333333", alpha: 1)
CGColor.rgb(65, 65, 65, 1)

Font.ping(.regular(12))

NSMutableAttributedString(string: "")
		.append(string: "¥")
		.appendStyle(.font(.ping(.bold(16))), string: "100")
		.append(string: "/天")
		
flower_button.link.setAction { sender in }

flower_View.link.addGesture([UITapGestureRecognizer(), UILongPressGestureRecognizer()]) { sender in
	if sender is UITapGestureRecognizer {
		print("Tap Action")
	}else {
		print("Long Action")
	}
}
```




## Author

marst123, tianlan2325@qq.com

## License

FlowerCocoa is available under the MIT license. See the LICENSE file for more info.
