import UIKit


public extension Link where Base: Flower_Control {
    
    /// 是否可用
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Link {
        self.base.isEnabled = isEnabled
        return self
    }
    
    /// 是否选中
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Link {
        self.base.isSelected = isSelected
        return self
    }
    
    /// 添加点击事件
    @discardableResult
    func addTarget(_ target: Any?, action: Selector, event: UIControl.Event = .touchUpInside) -> Link {
        self.base.addTarget(target, action: action, for: event)
        return self
    }
    
    /// 逃逸闭包的点击事件
    @discardableResult
    func setAction(event: UIControl.Event = .touchUpInside, action: @escaping ControlActionClosure) -> Link {
        self.base.setAction(event: event, action: action)
        return self
    }
    
    /// 内容的垂直对齐方式
    @discardableResult
    func contentVertical(_ alignment: UIControl.ContentVerticalAlignment) -> Link {
        self.base.contentVerticalAlignment = alignment
        return self
    }
    
    /// 内容的水平对齐方式
    @discardableResult
    func contentHorizontal(_ alignment: UIControl.ContentHorizontalAlignment) -> Link {
        self.base.contentHorizontalAlignment = alignment
        return self
    }
    
}
