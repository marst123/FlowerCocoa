import UIKit

private var ActionClosure_Key: Void?

public typealias ControlActionClosure = (_ sender: UIControl) -> Void

public class ActionClosureWrapper: NSObject {
    public var closure: ControlActionClosure
    public init(closure: @escaping ControlActionClosure) {
        self.closure = closure
    }
}


// MARK: 用户事件 - 基于 UIControl.Event
public extension UIControl {
    
    func setAction(event: UIControl.Event, action: @escaping ControlActionClosure) {
        objc_setAssociatedObject(self, &ActionClosure_Key, ActionClosureWrapper(closure: action), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: #selector(handleAction(sender:)), for: event)
    }
    
    @objc func handleAction(sender: UIControl) {
        (objc_getAssociatedObject(self, &ActionClosure_Key) as? ActionClosureWrapper)?.closure(sender)
    }
    
}


// MARK: 唯一编码identifier
extension UIControl {
    private struct AssociatedKeys {
        static var identifier_Key = "buttonIdentifier"
    }
    /// 添加一个名为 "identifier" 的属性标识符
    var identifier: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.identifier_Key) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.identifier_Key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

}

