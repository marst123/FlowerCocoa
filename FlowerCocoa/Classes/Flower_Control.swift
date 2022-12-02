import UIKit


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
    func addTarget(_ target: Any?, action: Selector, event: UIControl.Event = .touchUpInside) -> Link {
        self.base.addTarget(target, action: action, for: event)
        return self
    }
    
    @discardableResult
    func setAction(event: UIControl.Event = .touchUpInside, action: @escaping ClosureControlActionClosure) -> Link {
        self.base.setAction(event: event, action: action)
        return self
    }
    
    @discardableResult
    func contentVertical(_ alignment: UIControl.ContentVerticalAlignment) -> Link {
        self.base.contentVerticalAlignment = alignment
        return self
    }
    
    @discardableResult
    func contentHorizontal(_ alignment: UIControl.ContentHorizontalAlignment) -> Link {
        self.base.contentHorizontalAlignment = alignment
        return self
    }
    
}
