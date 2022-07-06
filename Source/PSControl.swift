//
//  PSControl.swift
//  gogo
//
//  Created by Mac on 2022/4/26.
//

import UIKit

public typealias PSControl = UIControl

public extension Link where Base: PSControl {
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Link {
        self.base.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Link {
        self.base.isSelected = isSelected
        return self
    }
    
    @discardableResult
    func addTarget(_ target: Any?, action: Selector) -> Link {
        self.base.addTarget(target, action: action, for: .touchUpInside)
        return self
    }
    
}
