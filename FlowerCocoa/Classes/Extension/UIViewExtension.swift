import UIKit
import SnapKit

//方向
public enum LineDirection {
    
    case inTop
    
    case inLeft
    
    case inBottom
    
    case inRight
}

//相对距离
public enum LineEqualTo {
    
    case equalTo                //等于
    
    case lessTo(CGFloat)        //小于
    
    case greaterTo(CGFloat)     //大于
}


private var AddImage_Key: UInt8 = 0

private var GestureClosure_Key: Void?

public typealias CustomGestureClosure = (_ sender: UIGestureRecognizer) -> Void

public class GestureClosureWrapper: NSObject {
    public var closure: CustomGestureClosure
    public init(closure: @escaping CustomGestureClosure) {
        self.closure = closure
    }
}



// MARK: 添加图片
extension UIView {
    var addImage: UIImage? {
        get {
            return objc_getAssociatedObject(self, &AddImage_Key) as? UIImage
        }
        set {
            objc_setAssociatedObject(self, &AddImage_Key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                        
            // 将设置的图片展示在UIView上
            let layer = CALayer()
            layer.frame = self.bounds
            layer.contents = newValue?.cgImage
            self.layer.addSublayer(layer)
        }
    }
}


// MARK: 响应事件 - 基于 UIGestureRecognizer
public extension UIView {
    
    func setAction(recognizers: [UIGestureRecognizer], action: @escaping CustomGestureClosure) {
        objc_setAssociatedObject(self, &GestureClosure_Key, GestureClosureWrapper(closure: action), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        for recognizer in recognizers {
            addGestureRecognizer(recognizer)
            recognizer.addTarget(self, action: #selector(handleGesture(sender:)))
        }
    }
    
    @objc func handleGesture(sender: UIGestureRecognizer) {
        (objc_getAssociatedObject(self, &GestureClosure_Key) as? GestureClosureWrapper)?.closure(sender)
    }
    
}


// MARK: 画线Line
public extension UIView {
    
    /// 划线
    func underline(_ direction: LineDirection, lineWidth: CGFloat, color: UIColor, inset: CGFloat, equal: LineEqualTo) {
        customLine(direction, lineWidth: lineWidth, color: color, inset: inset, equal: equal)
    }
    
    private func customLine(_ direction: LineDirection, lineWidth: CGFloat, color: UIColor, inset: CGFloat, equal: LineEqualTo) {
        let view = UIView()
        view.backgroundColor = color
        self.addSubview(view)
        var distance: CGFloat = 0 //距离
        switch equal {
        case .equalTo:
            break
        case .lessTo(let cGFloat):
            distance = cGFloat
        case .greaterTo(let cGFloat):
            distance = -cGFloat
        }
        
        view.snp.makeConstraints { (make) in
            switch direction {
            case .inTop:
                make.left.equalToSuperview().inset(distance)
                make.right.equalToSuperview().inset(distance)
                make.bottom.equalTo(self.snp.top).inset(-inset)
                make.height.equalTo(lineWidth)
                
            case .inLeft:
                make.top.equalToSuperview().inset(distance)
                make.bottom.equalToSuperview().inset(distance)
                make.right.equalTo(self.snp.left).inset(-inset)
                make.width.equalTo(lineWidth)
                
            case .inRight:
                make.top.equalToSuperview().inset(distance)
                make.bottom.equalToSuperview().inset(distance)
                make.left.equalTo(self.snp.right).inset(-inset)
                make.width.equalTo(lineWidth)
                
            case .inBottom:
                make.left.equalToSuperview().inset(distance)
                make.right.equalToSuperview().inset(distance)
                make.top.equalTo(self.snp.bottom).inset(-inset)
                make.height.equalTo(lineWidth)
            }
        }
    }
}
