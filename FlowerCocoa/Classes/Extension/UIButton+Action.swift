import UIKit

private var ActionClosure_Key: Void?

public typealias ClosureControlActionClosure = (_ sender: UIControl) -> Void

public class ActionClosureWrapper: NSObject {
    public var closure: ClosureControlActionClosure
    public init(closure: @escaping ClosureControlActionClosure) {
        self.closure = closure
    }
}

extension UIControl {
    
    public func setAction(event: UIControl.Event, action: @escaping ClosureControlActionClosure) {
        objc_setAssociatedObject(self, &ActionClosure_Key, ActionClosureWrapper(closure: action), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: #selector(handleAction(sender:)), for: event)
    }
    
    @objc public func handleAction(sender: UIControl) {
        (objc_getAssociatedObject(self, &ActionClosure_Key) as? ActionClosureWrapper)?.closure(sender)
    }
    
}
