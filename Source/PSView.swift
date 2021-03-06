//
//  PSView.swift
//  CampYouXi
//
//  Created by Mac on 2022/3/28.
//

import UIKit

public typealias PSView = UIView

public extension Link where Base: PSView {
    
    // 尽量不使用这里处理约束,snapkit很方便,还是保证功能样式与视图坐标分离
    @discardableResult
    func multiplierH(_ equalTo: NSLayoutDimension, multiplier: CGFloat) -> Link {
        self.base.heightAnchor.constraint(equalTo: equalTo, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult
    func multiplierW(_ equalTo: NSLayoutDimension, multiplier: CGFloat) -> Link {
        self.base.widthAnchor.constraint(equalTo: equalTo, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult
    func left(_ equalTo: NSLayoutAnchor<NSLayoutXAxisAnchor>, cons: CGFloat) -> Link {
        self.base.leftAnchor.constraint(equalTo: equalTo, constant: cons).isActive = true
        return self
    }
    
    @discardableResult
    func right(_ equalTo: NSLayoutAnchor<NSLayoutXAxisAnchor>, cons: CGFloat) -> Link {
        self.base.rightAnchor.constraint(equalTo: equalTo, constant: cons).isActive = true
        return self
    }
    
    @discardableResult
    func size( w: CGFloat, h: CGFloat) -> Link {
        self.base.widthAnchor.constraint(equalToConstant: w).isActive = true
        self.base.heightAnchor.constraint(equalToConstant: h).isActive = true
        return self
    }
    
    @discardableResult
    func height(_ h: CGFloat) -> Link {
        self.base.heightAnchor.constraint(equalToConstant: h).isActive = true
        return self
    }
    
    @discardableResult
    func width(_ w: CGFloat) -> Link {
        self.base.widthAnchor.constraint(equalToConstant: w).isActive = true
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Link {
        self.base.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat, masksToBounds: Bool? = nil) -> Link {
        self.base.layer.cornerRadius = cornerRadius
        if let mask = masksToBounds {
            self.base.layer.masksToBounds = mask
        }
        return self
    }
    
    @discardableResult
    func borderColor(_ borderColor: UIColor?) -> Link {
        self.base.layer.borderColor = borderColor?.cgColor
        return self
    }
    
    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> Link {
        self.base.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    func shadowColor(_ shadowColor: UIColor?) -> Link {
        self.base.layer.shadowColor = shadowColor?.cgColor
        return self
    }
    
    @discardableResult
    func shadowOpacity(_ shadowOpacity: Float) -> Link {
        self.base.layer.shadowOpacity = shadowOpacity
        return self
    }
    
    @discardableResult
    func shadowOffset(_ shadowOffset: CGSize) -> Link {
        self.base.layer.shadowOffset = shadowOffset
        return self
    }
    
    @discardableResult
    func shadowRadius(_ shadowRadius: CGFloat) -> Link {
        self.base.layer.shadowRadius = shadowRadius
        return self
    }
    
    @discardableResult
    func shadowPath(_ shadowPath: CGPath?) -> Link {
        self.base.layer.shadowPath = shadowPath
        return self
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Link {
        self.base.alpha = alpha
        return self
    }
    
    /// 透明度减少开销,大于color - clear
    @discardableResult
    func isOpaque(_ isOpaque: Bool) -> Link {
        self.base.isOpaque = isOpaque
        return self
    }
    
    @discardableResult
    func bgColor(_ backgroundColor: UIColor?) -> Link {
        self.base.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ enabled: Bool) -> Link {
        self.base.isUserInteractionEnabled = enabled
        return self
    }
    
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Link {
        self.base.contentMode = mode
        return self
    }
    
    @discardableResult
    func roundingCorners(_ roundingCorners: UIRectCorner, radius: CGFloat) -> Link {
        let bpath = UIBezierPath.init(roundedRect: self.base.bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer = CAShapeLayer.init()
        shapeLayer.frame = self.base.bounds
        shapeLayer.path = bpath.cgPath
        self.base.layer.mask = shapeLayer
        
        return self
    }
    
}
