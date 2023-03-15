import UIKit

public enum Flower_AttributedState {
    
    case font(UIFont)                                   //  字体
    
    case tinColor(UIColor)                              //  字体颜色
    
    case bgColor(UIColor)                               //  背景颜色
    
    case paragraph(NSParagraphStyle)                    //  控制段落
    
    case attachment(NSTextAttachment)                   //  图文混编
    
    case underline(NSUnderlineStyle, UIColor?)          //  下划线 (none:没有线, single:单条, double:双条, thick:粗线)
    
    case strikethrough(NSUnderlineStyle, UIColor?)      //  删除线 (none:没有线, single:单条, double:双条, thick:粗线)
    
    case kern(Int)                                      //  横向字间距
    
    case baselineOffset(Int)                            //  文字偏移量
    
    case shadow(NSShadow)                               //  文字阴影
    
    case link(String)                                   //  超链接
    
    case none
    
    public var value: [NSAttributedString.Key:Any] { return fill() }
    
    public func fill(in result: [NSAttributedString.Key:Any] = [:]) -> [NSAttributedString.Key:Any] {
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
            
        case .kern(let value):
            result[.kern] = value
            
        case .baselineOffset(let value):
            result[.baselineOffset] = value
            
        case .shadow(let value):
            result[.shadow] = value
            
        case .link(let url):
            result[.link] = url
            
        case .none:
            break
        
        }
        
        return result
    }
}


// MARK: 富文本样式
public extension NSMutableAttributedString {
    
    /// 重写init 支持PSAttributedMode
    convenience init(string: String, attribute: Flower_AttributedState) {
        self.init(string: string, attributes: [attribute])
    }
    
    /// 重写init 支持[PSAttributedMode]
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




