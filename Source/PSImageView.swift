//
//  PSImageView.swift
//  gogo
//
//  Created by Mac on 2022/4/28.
//

import UIKit

public typealias PSImageView = UIImageView


public extension Link where Base: PSImageView {

    @discardableResult
    func image(_ image: UIImage?) -> Link {
        self.base.image = image
        return self
    }
    
    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Link {
        self.base.isHighlighted = isHighlighted
        return self
    }
    
}
