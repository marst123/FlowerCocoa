import UIKit


public extension NSMutableAttributedString {
    
    /// 重写init 支持PSAttributedMode
    convenience init(string: String, attribute: Flower_AttributedState) {
        self.init(string: string, attributes: [attribute])
    }
    
    /// /// 重写init 支持[PSAttributedMode]
    convenience init(string: String, attributes: [Flower_AttributedState]) {
        self.init(string: string, attributes: attributes.reduce([:], { $1.fill(in: $0) }))
    }

    @discardableResult
    func style(_ state: Flower_AttributedState = .none, range: NSRange) -> NSMutableAttributedString {
        addAttributes(state.value, range: range)
        return self
    }
    
    @discardableResult
    func styles(_ states: [Flower_AttributedState], range: NSRange) -> Self {
        addAttributes(states.reduce([:], { $1.fill(in: $0) }), range: range)
        return self
    }
    
    @discardableResult
    func append(string: String) -> Self {
        append(NSMutableAttributedString(string: string, attribute: .none))
        return self
    }
    
    @discardableResult
    func appendStyle(_ stste: Flower_AttributedState, string: String) -> Self {
        append(NSMutableAttributedString(string: string, attribute: stste))
        return self
    }
    
    @discardableResult
    func appendStyles(_ states: [Flower_AttributedState], string: String) -> Self {
        append(NSMutableAttributedString(string: string, attributes: states.reduce([:], { $1.fill(in: $0) })))
        return self
    }

}



public enum Flower_AttributedState {
    
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
