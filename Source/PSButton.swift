//
//  PSButton.swift
//  AAAAAA
//
//  Created by Mac on 2021/9/1.
//

import UIKit

public typealias PSButton = UIButton

public extension Link where Base: PSButton {
    
    @discardableResult
    func stateNormal(_ clo: ((PSButtonMode) -> ())) -> Link<Base> {
        clo(.normal(self.base))
        return self
    }
    
    @discardableResult
    func stateSelected(_ clo: ((PSButtonMode) -> ())) -> Link<Base> {
        clo(.selected(self.base))
        return self
    }
    
    @discardableResult
    func stateHighlighted(_ clo: ((PSButtonMode) -> ())) -> Link<Base> {
        clo(.highlighted(self.base))
        return self
    }
    
    @discardableResult
    func stateDisabled(_ clo: ((PSButtonMode) -> ())) -> Link<Base> {
        clo(.disabled(self.base))
        return self
    }
    
    @discardableResult
    func alignment(_ textAlignment: NSTextAlignment) -> Link {
        self.base.titleLabel?.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    func lines(_ numberOfLines: Int) -> Link {
        self.base.titleLabel?.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    func titleEdge(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Link {
        self.base.titleEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @discardableResult
    func imageEdge(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Link {
        self.base.imageEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @discardableResult
    func defaultEdges(style: ButtonEdgeInsetsStyle, space:CGFloat) -> Link {
        self.base.layoutEdges(style: style, space: space)
        return self
    }
    
    // 管理button方法硬编码
    
}


public enum PSButtonMode {
    case normal(PSButton)
    case selected(PSButton)
    case highlighted(PSButton)
    case disabled(PSButton)
    
    @discardableResult
    func title(_ title: String?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setTitle(title, for: .normal)
        case .selected(let pSButton):
            pSButton.setTitle(title, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setTitle(title, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setTitle(title, for: .disabled)
        }
        return self
    }
    
    @discardableResult
    func color(_ color: UIColor?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setTitleColor(color, for: .normal)
        case .selected(let pSButton):
            pSButton.setTitleColor(color, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setTitleColor(color, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setTitleColor(color, for: .disabled)
        }
        return self
    }
    
    @discardableResult
    func attrText(_ attrText: NSAttributedString?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setAttributedTitle(attrText, for: .normal)
        case .selected(let pSButton):
            pSButton.setAttributedTitle(attrText, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setAttributedTitle(attrText, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setAttributedTitle(attrText, for: .disabled)
        }
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setImage(image, for: .normal)
        case .selected(let pSButton):
            pSButton.setImage(image, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setImage(image, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setImage(image, for: .disabled)
        }
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?) -> Self {
        switch self {
        case .normal(let pSButton):
            pSButton.setBackgroundImage(image, for: .normal)
        case .selected(let pSButton):
            pSButton.setBackgroundImage(image, for: .selected)
        case .highlighted(let pSButton):
            pSButton.setBackgroundImage(image, for: .highlighted)
        case .disabled(let pSButton):
            pSButton.setBackgroundImage(image, for: .disabled)
        }
        return self
    }
    
}



