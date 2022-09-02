import UIKit

public enum TextFieldTrait { }
public enum KeyBoardTrait { }


public typealias Flower_TextField = UITextField

public extension Link where Base: Flower_TextField {
    
    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate?) -> Link {
        self.base.delegate = delegate
        return self
    }
    
    @discardableResult
    func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Link {
        self.base.borderStyle = borderStyle
        return self
    }
    
    @discardableResult
    func leftViewMode(_ leftViewMode: UITextField.ViewMode) -> Link {
        self.base.leftViewMode = leftViewMode
        return self
    }
    
    @discardableResult
    func leftView(_ leftView: UIView?) -> Link {
        self.base.leftView = leftView
        return self
    }
    
    @discardableResult
    func rightViewMode(_ rightViewMode: UITextField.ViewMode) -> Link {
        self.base.rightViewMode = rightViewMode
        return self
    }
    
    @discardableResult
    func rightView(_ rightView: UIView?) -> Link {
        self.base.rightView = rightView
        return self
    }
    
    @discardableResult
    func secureTextEntry(_ secureTextEntry: Bool) -> Link {
        self.base.isSecureTextEntry = secureTextEntry
        return self
    }
    
    @discardableResult
    func keyboardType(_ keyboardType: UIKeyboardType) -> Link {
        self.base.keyboardType = keyboardType
        return self
    }
    
    @discardableResult
    func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Link {
        self.base.returnKeyType = returnKeyType
        return self
    }
    
    /// SwifterSwift: Clear text.
    @discardableResult
    func clear() -> Link {
        self.base.text = ""
        self.base.attributedText = NSAttributedString(string: "")
        return self
    }

    /// SwifterSwift: Set placeholder text color.
    @discardableResult
    func placeholder(_ text: String, _ color: UIColor) -> Link {
        if !text.isEmpty {
            self.base.placeholder = text
            self.base.attributedPlaceholder = NSAttributedString(string: text, attributes: [.foregroundColor: color])
        }
        return self
    }

    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameter padding: amount of padding to apply to the left of the textfield rect.
    @discardableResult
    func paddingLeft(_ padding: CGFloat) -> Link {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.base.frame.height))
        self.base.leftView = paddingView
        self.base.leftViewMode = .always
        return self
    }

    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameters:
    ///   - image: left image
    ///   - padding: amount of padding between icon and the left of textfield
    @discardableResult
    func paddingLeftIcon(_ image: UIImage, padding: CGFloat) -> Link {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        self.base.leftView = imageView
        self.base.leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        self.base.leftViewMode = .always
        return self
    }
    
}
