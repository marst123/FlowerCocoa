//
//  PSFont.swift
//  CampYouXi
//
//  Created by Mac on 2022/3/28.
//

import UIKit

public typealias PSFont = UIFont

public extension PSFont {
    class func ping(_ fontMode: PSFontMode) -> UIFont {
        return fontMode.ping
    }
}

public enum PSFontMode {

    case bold(CGFloat)
    case light(CGFloat)
    case regular(CGFloat)
    case medium(CGFloat)
    case semibold(CGFloat)
    case ultraLight(CGFloat)
    case heavy(CGFloat)
    case black(CGFloat)
    
    var ping: UIFont {
        switch self {
        case .bold(let int):
            return UIFont.systemFont(ofSize: int, weight: .bold)
        case .light(let int):
            return UIFont.systemFont(ofSize: int, weight: .light)
        case .regular(let int):
            return UIFont.systemFont(ofSize: int, weight: .regular)
        case .medium(let int):
            return UIFont.systemFont(ofSize: int, weight: .medium)
        case .semibold(let int):
            return UIFont.systemFont(ofSize: int, weight: .semibold)
        case .ultraLight(let int):
            return UIFont.systemFont(ofSize: int, weight: .ultraLight)
        case .heavy(let int):
            return UIFont.systemFont(ofSize: int, weight: .heavy)
        case .black(let int):
            return UIFont.systemFont(ofSize: int, weight: .black)
        }
    }
    
}

public extension Link where Base: FontFormat {
    @discardableResult
    func font(_ fontMode: PSFontMode) -> Link {
        self.base.font(fontMode)
        return self
    }
}


public protocol FontFormat {
    func font(_ fontMode: PSFontMode)
}

extension PSLabel: FontFormat {
    public func font(_ fontMode: PSFontMode) {
        self.font = fontMode.ping
    }
}

extension PSButton: FontFormat {
    public func font(_ fontMode: PSFontMode) {
        self.titleLabel?.font = fontMode.ping
    }
}

extension PSTextView: FontFormat {
    public func font(_ fontMode: PSFontMode) {
        self.font = fontMode.ping
    }
}


extension PSTextField: FontFormat {
    public func font(_ fontMode: PSFontMode) {
        self.font = fontMode.ping
    }
}





