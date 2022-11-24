import Foundation

private var GestureClosure_Key: Void?

public typealias CustomGestureClosure = (_ sender: UIGestureRecognizer) -> Void

public class GestureClosureWrapper: NSObject {
    public var closure: CustomGestureClosure
    public init(closure: @escaping CustomGestureClosure) {
        self.closure = closure
    }
}

extension UIView {
    
    public func setAction(recognizers: [UIGestureRecognizer], action: @escaping CustomGestureClosure) {
        objc_setAssociatedObject(self, &GestureClosure_Key, GestureClosureWrapper(closure: action), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        for recognizer in recognizers {
            addGestureRecognizer(recognizer)
            recognizer.addTarget(self, action: #selector(handleGesture(sender:)))
        }
    }
    
    @objc public func handleGesture(sender: UIGestureRecognizer) {
        (objc_getAssociatedObject(self, &GestureClosure_Key) as? GestureClosureWrapper)?.closure(sender)
    }
    
}
