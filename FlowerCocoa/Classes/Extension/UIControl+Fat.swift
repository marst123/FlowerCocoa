import Foundation

private var ActionClosure_Key: Void?

public typealias CustomActionClosure = (_ sender: UIControl) -> Void

public class ActionClosureWrapper: NSObject {
    public var closure: CustomActionClosure
    public init(closure: @escaping CustomActionClosure) {
        self.closure = closure
    }
}

extension UIControl {
    
    public func setAction(event: UIControl.Event, action: @escaping CustomActionClosure) {
        objc_setAssociatedObject(self, &ActionClosure_Key, ActionClosureWrapper(closure: action), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: #selector(handleAction(sender:)), for: event)
    }
    
    @objc public func handleAction(sender: UIControl) {
        (objc_getAssociatedObject(self, &ActionClosure_Key) as? ActionClosureWrapper)?.closure(sender)
    }
    
}
