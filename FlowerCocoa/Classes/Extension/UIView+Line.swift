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

extension UIView {
    
    /// 划线
    func underline(_ direction: LineDirection, lineWidth: CGFloat, color: UIColor, inset: CGFloat, equal: LineEqualTo) {
        customLine(direction, lineWidth: lineWidth, color: color, inset: inset, equal: equal)
    }
    
    func customLine(_ direction: LineDirection, lineWidth: CGFloat, color: UIColor, inset: CGFloat, equal: LineEqualTo) {
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
                make.bottom.equalTo(self.snp_top).inset(-inset)
                make.height.equalTo(lineWidth)
                
            case .inLeft:
                make.top.equalToSuperview().inset(distance)
                make.bottom.equalToSuperview().inset(distance)
                make.right.equalTo(self.snp_left).inset(-inset)
                make.width.equalTo(lineWidth)
                
            case .inRight:
                make.top.equalToSuperview().inset(distance)
                make.bottom.equalToSuperview().inset(distance)
                make.left.equalTo(self.snp_right).inset(-inset)
                make.width.equalTo(lineWidth)
                
            case .inBottom:
                make.left.equalToSuperview().inset(distance)
                make.right.equalToSuperview().inset(distance)
                make.top.equalTo(self.snp_bottom).inset(-inset)
                make.height.equalTo(lineWidth)
            }
        }
    }
}
