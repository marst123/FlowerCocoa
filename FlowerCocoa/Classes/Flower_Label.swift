import UIKit

public typealias Flower_Label = UILabel


public extension Link where Base: Flower_Label {

    
    @discardableResult
    func titleColor(_ textColor: UIColor?) -> Link {
        self.base.textColor = textColor
        return self
    }
    
    @discardableResult
    func alignment(_ textAlignment: NSTextAlignment) -> Link {
        self.base.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    func lines(_ numberOfLines: Int) -> Link {
        self.base.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    func text(_ title: String?) -> Link<Base> {
        self.base.text = title
        return self
    }
    
    @discardableResult
    func attributedText(_ title: NSAttributedString?) -> Link<Base> {
        self.base.attributedText = title
        return self
    }
    
    @discardableResult
    func lineBreakMode(_ mode: NSLineBreakMode) -> Link {
        self.base.lineBreakMode = mode
        return self
    }
    
    @discardableResult
    func minimumScale(_ scale: CGFloat) -> Link {
        self.base.minimumScaleFactor = scale
        return self
    }
    
    
}
