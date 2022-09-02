import UIKit

public typealias Flower_Control = UIControl

public extension Link where Base: Flower_Control {
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Link {
        self.base.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Link {
        self.base.isSelected = isSelected
        return self
    }
    
    @discardableResult
    func addTarget(_ target: Any?, action: Selector) -> Link {
        self.base.addTarget(target, action: action, for: .touchUpInside)
        return self
    }
    
}
