import UIKit


public extension Link where Base: Flower_View {
    
    
    /*
     透明度减少开销,大于color - clear
     */
    /// 是否透明度
    @discardableResult
    func isOpaque(_ isOpaque: Bool) -> Link {
        self.base.isOpaque = isOpaque
        return self
    }
    
    /// 是否隐藏
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Link {
        self.base.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ enabled: Bool) -> Link {
        self.base.isUserInteractionEnabled = enabled
        return self
    }
    
    /*
     尽量不使用这里处理约束,snapkit很方便,还是保证功能样式与视图坐标分离
     */
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
    
    /// 圆角半径
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat, masksToBounds: Bool? = nil) -> Link {
        self.base.layer.cornerRadius = cornerRadius
        if let mask = masksToBounds {
            self.base.layer.masksToBounds = mask
        }
        return self
    }
    
    /// 边框颜色
    @discardableResult
    func borderColor(_ borderColor: UIColor?) -> Link {
        self.base.layer.borderColor = borderColor?.cgColor
        return self
    }
    
    /// 边框宽度
    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> Link {
        self.base.layer.borderWidth = borderWidth
        return self
    }
    
    /// 阴影颜色
    @discardableResult
    func shadowColor(_ shadowColor: CGColor?) -> Link {
        self.base.layer.shadowColor = shadowColor
        return self
    }
    
    /// 阴影透明度
    @discardableResult
    func shadowOpacity(_ shadowOpacity: Float) -> Link {
        self.base.layer.shadowOpacity = shadowOpacity
        return self
    }
    
    /// 阴影偏移量
    @discardableResult
    func shadowOffset(_ shadowOffset: CGSize) -> Link {
        self.base.layer.shadowOffset = shadowOffset
        return self
    }
    
    /// 阴影半径
    @discardableResult
    func shadowRadius(_ shadowRadius: CGFloat) -> Link {
        self.base.layer.shadowRadius = shadowRadius
        return self
    }
    
    /// 阴影路径
    @discardableResult
    func shadowPath(_ shadowPath: CGPath?) -> Link {
        self.base.layer.shadowPath = shadowPath
        return self
    }
    
    /// 视图的透明度
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Link {
        self.base.alpha = alpha
        return self
    }
    
    ///tint 颜色
    @discardableResult
    func tintColor(_ tintColor: UIColor?) -> Link {
        self.base.tintColor = tintColor
        return self
    }
    
    /// 背景颜色
    @discardableResult
    func bgColor(_ backgroundColor: UIColor?) -> Link {
        self.base.backgroundColor = backgroundColor
        return self
    }
    
    /// 视图的内容模式
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Link {
        self.base.contentMode = mode
        return self
    }
    
    /// 贝塞尔路径使视图的图层指定圆角
    @discardableResult
    func roundingCorners(_ roundingCorners: UIRectCorner, radius: CGFloat) -> Link {
        let bpath = UIBezierPath.init(roundedRect: self.base.bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer = CAShapeLayer.init()
        shapeLayer.frame = self.base.bounds
        shapeLayer.path = bpath.cgPath
        self.base.layer.mask = shapeLayer
        
        return self
    }
    
    /// 在指定方向上为视图添加line线
    @discardableResult
    func underline(_ direction: LineDirection, lineWidth: CGFloat = 1, color: UIColor, inset: CGFloat = 0, equal: LineEqualTo = .equalTo) -> Link {
        self.base.underline(direction, lineWidth: lineWidth, color: color, inset: inset, equal: equal)
        return self
    }
    
    /// 为视图添加手势
    @discardableResult
    func addGesture(_ recognizer: UIGestureRecognizer) -> Link {
        self.base.addGestureRecognizer(recognizer)
        return self
    }
    
    /*
     example:
     link.addGesture([UITapGestureRecognizer(), UILongPressGestureRecognizer()]) { sender in
     if sender is UITapGestureRecognizer {
        print("333333")
     }else {
        print("444444")
     }
     */
    /// 添加操作手势
    @discardableResult
    func addGesture(_ recognizers: [UIGestureRecognizer], action: @escaping CustomGestureClosure) -> Link {
        self.base.setAction(recognizers: recognizers, action: action)
        return self
    }
    
    /// 移除操作手势
    @discardableResult
    func removeGesture(_ recognizers: [UIGestureRecognizer]) -> Link {
        for recognizer in recognizers {
            self.base.removeGestureRecognizer(recognizer)
        }
        return self
    }
    
    /// 从父视图中移除自身
    @discardableResult
    func removeFromSuperView() -> Link {
        self.base.removeFromSuperview()
        return self
    }
    
    // 转CALayer绘制
    @discardableResult
    func insertLayer(_ layer: CALayer, at index: UInt32 = 0) -> Link {
        self.base.layer.insertSublayer(layer, at: index)
        return self
    }
    
    // 转CALayer绘制
    @discardableResult
    func toLayer(_ layer: CALayer) -> Link {
        self.base.layer.addSublayer(layer)
        return self
    }
    
    /*
     CATransform3D是用于处理三维变换的类，可以在三个轴上进行平移、旋转、缩放和扭曲.
     它通常应用于对图层进行立体变换,将一个视图呈现3D效果
     */
    /// 转换矩阵3D
    @discardableResult
    func transform(_ transform: CATransform3D) -> Link {
        self.base.layer.transform = transform
        return self
    }
    
    /*
     /// let tra = CGAffineTransform.identity 初始化
     /// 链式调用:
     /// rotated             旋转
     /// scaled              缩放
     /// translated         平移
     */
    /*
     CGAffineTransform处理二维变换的类，可以在平面内进行平移、旋转、缩放和斜切等变换
     */
    ///仿射变换2D
    @discardableResult
    func toAffineTransform(_ affineTransform: CGAffineTransform) -> Link {
        self.base.layer.setAffineTransform(affineTransform)
        return self
    }
}
