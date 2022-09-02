import UIKit

public typealias Flower_TextView = UITextView

public extension Link where Base: Flower_TextView {
    @discardableResult
    func delegate(_ delegate: UITextViewDelegate?) -> Link {
        self.base.delegate = delegate
        return self
    }
    
    @discardableResult
    func keyboardType(_ keyboardType: UIKeyboardType) -> Link {
        self.base.keyboardType = keyboardType
        return self
    }
    
    @discardableResult
    func dataDetectorTypes(_ dataDetectorTypes: UIDataDetectorTypes) -> Link {
        self.base.dataDetectorTypes = dataDetectorTypes
        return self
    }
    
    /// 是否允许编辑文本内容, 默认true
    @discardableResult
    func isEditable(_ isEditable: Bool) -> Link {
        self.base.isEditable = isEditable
        return self
    }
    
    /// 是否允许滚动, 默认true
    @discardableResult
    func isScroll(_ isEnabled: Bool) -> Link {
        self.base.isScrollEnabled = isEnabled
        return self
    }
    
    /// 是否允许滚动, 默认true
    @discardableResult
    func edges(_ inset: UIEdgeInsets) -> Link {
        self.base.textContainerInset = inset
        return self
    }
    
    /// 是否允许滚动, 默认true
    @discardableResult
    func textColor(_ textColor: UIColor) -> Link {
        self.base.textColor = textColor
        return self
    }
    
}
