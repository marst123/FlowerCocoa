# FlowerCocoa

[![CI Status](https://img.shields.io/travis/marst123/FlowerCocoa.svg?style=flat)](https://travis-ci.org/marst123/FlowerCocoa)
[![Version](https://img.shields.io/cocoapods/v/FlowerCocoa.svg?style=flat)](https://cocoapods.org/pods/FlowerCocoa)
[![License](https://img.shields.io/cocoapods/l/FlowerCocoa.svg?style=flat)](https://cocoapods.org/pods/FlowerCocoa)
[![Platform](https://img.shields.io/cocoapods/p/FlowerCocoa.svg?style=flat)](https://cocoapods.org/pods/FlowerCocoa)



FlowerCocoa is a set of UIKit-based control libraries that I independently encapsulate with reference to Rx's notation, and its core relies on link.

## Design idea

Before the design, I always think that the syntax and freedom at the code level is the initial design idea. Swift provides me with such convenience, and I need to make it more convenient.

To

```
swift
let label = UILabel()
label.text = name
label.textColor = color

chain
let label = UILabel()
			.text(name)
			.textColor(color)
```

Obviously the next one I prefer is pass. This joint, which makes up the available function, has removed duplicate claims in contrast to the previous approach.

That was my initial idea, and I just wanted to keep things simple with chain thinking, by initiating UI and defining properties through chain calls. Then I realized that in practice, I also needed to be able to communicate with each other, so on top of that, I used `Link` to interject other attributes. Through this `Link` layer, I can define new roles within the scope of what NSObject allows, without being constrained by which role (reference, Rx).

Suppose Link is a multifunctional plugboard to support other electronic devices, and electronic devices can be reified as UIKit, QuartzCore, etc.

In electronic equipment, different brands have different characteristics, but also have the same protocol characteristics, and the subclass inheritance fully reflects its similarities and differences

This is a very simple library that keeps the UI definition as simple as possible (while I am gradually testing and adding CA-related content).

Anyway, it's simple enough, and that's enough.

## Features

- [x] `Link` based, support to extend.

- [x] Extensions for `UIAlertController`,` UIAlertAction`,` UIButton`, `UICollectionView`,` UICollectionViewFlowLayout`,` UIControl`,`UIControl`,`UILabel`,`UIStackView`,`UITableView`,`UIView`..

- [x] One line of code sets the font, color and image.

- [x] Simple gesture operation.

- [x] Compiling rich text is more user-friendly.

- [x] Clean code separation.

  

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FlowerCocoa is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FlowerCocoa'
```

## Method Chaining

**For a better experience, you need:**

UIView

```
    lazy var flower_View: UIView = {
        return UIView().link
            .bgColor(.white)
            .isUserInteractionEnabled(true)
            .base
    }()
```

UILabel

```
    lazy var flower_label: UILabel = {
        return UILabel().link
            .text("FlowerCocoa")
            .titleColor(.hex("#333333"))
            .font(.regular(12))
            .lines(0)
            .alignment(.justified)
            .base
    }()
```

UIButton

```
    lazy var flower_button: UIButton = {
        return UIButton().link
            .stateNormal({$0.title("FlowerCocoa")})
            .isEnabled(true)
            .setTag(tag: 10000)
            .base
    }()
```

UIStackView

```
    lazy var flower_Cocoa: UIStackView = {
        return UIStackView().link
            .config(.horizontal, alignment: .fill, distribution: .fill, spacing: 0)
            .arranged([flower_label, flower_button])
            .base
    }()
```

UITableView

```
    lazy var flower_tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain).link
            .rowHeight(49)
            .separator(.none)
            .base
    }()
```

UICollectionView

```
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

block

```
var flower_block: BlockHandler<Bool>?
var flower_nullblock: NullHandler?
```

register List

```
 flower_tableView.link
		.register(cellWithClass: Cell.self)
		.register(nibClass: Cell.self)
        
 flower_collectionView.link
		.register(viewClass: Cell.self)
		.registerHeader(viewClass: Cell.self)
```

color

```
.hex("#333333", alpha: 1)
.rgb(65, 65, 65, 1)
```

font

```
.regular(12)
```

image

```
.findName("flower")
```

AttributedString

```
NSMutableAttributedString(string: "")
		.append(string: "¥")
		.appendStyle(.font(.ping(.bold(16))), string: "100")
		.append(string: "/天")
```

action

```
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
