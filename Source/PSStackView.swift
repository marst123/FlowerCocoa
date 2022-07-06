//
//  PSStackView.swift
//  CampYouXi
//
//  Created by Mac on 2022/3/28.
//

import UIKit

public typealias PSStackView = UIStackView

public extension Link where Base: PSStackView {
    
    @discardableResult
    func label(_ closure: LabClosure? = nil) -> Link {
        let view = PSLabel()
        self.base.addArrangedSubview(view)
        closure?(view)
        return self
    }

    @discardableResult
    func button(_ closure: BtnClosure? = nil) -> Link {
        let view = UIButton()
        self.base.addArrangedSubview(view)
        closure?(view)
        return self
    }
    
    @discardableResult
    func textField(_ closure: TFClosure? = nil) -> Link {
        let view = PSTextField()
        self.base.addArrangedSubview(view)
        closure?(view)
        return self
    }

    @discardableResult
    func stackView(closure: @escaping StackViewClosure) -> Link {
        let view = UIStackView()
        self.base.addArrangedSubview(view)
        closure(view)
        return self
    }
    
    
    @discardableResult
    func arranged(_ subviews: [UIView]) -> Link {
        subviews.forEach { view in
            self.base.addArrangedSubview(view)
        }
        return self
    }

}

public extension Link where Base: PSStackView {
    
    @discardableResult
    func config(_ axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat) -> Link {
        self.base.axis = axis
        self.base.alignment = alignment
        self.base.distribution = distribution
        self.base.spacing = spacing
        return self
    }
    
}
