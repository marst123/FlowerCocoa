//
//  PSLabel.swift
//  AAAAAA
//
//  Created by Mac on 2021/9/1.
//

import UIKit

public typealias PSLabel = UILabel


public extension Link where Base: PSLabel {
    
    enum TextMode {
        case text(String?)
        case attributedText(NSAttributedString?)
    }
    
    @discardableResult
    func titleColor(_ textColor: UIColor?) -> Link {
        self.base.textColor = textColor
        return self
    }
    
    @discardableResult
    func alignment(_ textAlignment: NSTextAlignment) -> Link {
        self.base.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    func lines(_ numberOfLines: Int) -> Link {
        self.base.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    func title(_ mode: TextMode) -> Link<Base> {
        switch mode {
        case .text(let string):
            self.base.text = string
        case .attributedText(let nSAttributedString):
            self.base.attributedText = nSAttributedString
        }
        return self
    }

}
