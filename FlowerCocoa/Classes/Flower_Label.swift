import UIKit


public extension Link where Base: Flower_Label {

    
    @discardableResult
    func titleColor(_ color: UIColor?) -> Link {
        self.base.textColor = color
        return self
    }
    
    @discardableResult
    func highlightedTextColor(_ color: UIColor?) -> Link {
        self.base.highlightedTextColor = color
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

    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Link {
        self.base.isHighlighted = isHighlighted
        return self
    }
    
}


public extension Link where Base: Flower_InsetLabel {
    @discardableResult
    func titleEdges(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Link {
        self.base.textInsets.top = top
        self.base.textInsets.left = left
        self.base.textInsets.bottom = bottom
        self.base.textInsets.right = right
        return self
    }
}
