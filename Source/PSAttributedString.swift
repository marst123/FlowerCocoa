//
//  PSAttributedString.swift
//  gogo
//
//  Created by Mac on 2022/4/28.
//

import UIKit


public typealias PSAttributedString = NSMutableAttributedString

public extension PSAttributedString {
    
    /// 重写init 支持PSAttributedMode
    convenience init(string: String, attribute: PSAttributedMode) {
        self.init(string: string, attributes: [attribute])
    }
    
    /// /// 重写init 支持[PSAttributedMode]
    convenience init(string: String, attributes: [PSAttributedMode]) {
        self.init(string: string, attributes: attributes.reduce([:], { $1.fill(in: $0) }))
    }

    @discardableResult
    func style(_ mode: PSAttributedMode = .none, range: NSRange) -> NSMutableAttributedString {
        addAttributes(mode.value, range: range)
        return self
    }
    
    @discardableResult
    func styles(_ modes: [PSAttributedMode], range: NSRange) -> Self {
        addAttributes(modes.reduce([:], { $1.fill(in: $0) }), range: range)
        return self
    }
    
    @discardableResult
    func append(string: String) -> Self {
        append(NSMutableAttributedString(string: string, attribute: .none))
        return self
    }
    
    @discardableResult
    func appendStyle(_ mode: PSAttributedMode, string: String) -> Self {
        append(NSMutableAttributedString(string: string, attribute: mode))
        return self
    }
    
    @discardableResult
    func appendStyles(_ modes: [PSAttributedMode], string: String) -> Self {
        append(NSMutableAttributedString(string: string, attributes: modes.reduce([:], { $1.fill(in: $0) })))
        return self
    }

}

public typealias PSString = String

public extension PSString {

    

}

public enum PSAttributedMode {
    
    case font(UIFont)
    case tinColor(UIColor)
    case bgColor(UIColor)
    case paragraph(NSParagraphStyle)
    case attachment(NSTextAttachment)
    case underline(NSUnderlineStyle, UIColor?)
    case strikethrough(NSUnderlineStyle, UIColor?)
    case baselineOffset(Int)
    case shadow(NSShadow)
    case none
    
    var value: [NSAttributedString.Key:Any] { return fill() }
    
    func fill(in result: [NSAttributedString.Key:Any] = [:]) -> [NSAttributedString.Key:Any] {
        var result = result
        switch self {
            
        case .font(let font):
            result[.font] = font
            
        case .tinColor(let color):
            result[.foregroundColor] = color
            
        case .bgColor(let color):
            result[.backgroundColor] = color
            
        case .paragraph(let style):
            result[.paragraphStyle] = style
            
        case .attachment(let attachment):
            result[.attachment] = attachment
            
        case .underline(let style, let color):
            result[.underlineStyle] = style.rawValue
            if let color = color {
                result[.underlineColor] = color
            }
        case .strikethrough(let style, let color):
            result[.strikethroughStyle] = style.rawValue
            if let color = color {
                result[.strikethroughColor] = color
            }
        case .baselineOffset(let value):
            result[.baselineOffset] = value
            
        case .shadow(let value):
            result[.shadow] = value
            
        case .none:
            break
        
        }
        
        return result
    }
}
