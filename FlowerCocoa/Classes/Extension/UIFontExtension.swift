import UIKit

public enum Flower_FontState {

    case bold(CGFloat)
    
    case light(CGFloat)
    
    case regular(CGFloat)
    
    case medium(CGFloat)
    
    case semibold(CGFloat)
    
    case ultraLight(CGFloat)
    
    case heavy(CGFloat)
    
    case black(CGFloat)
    
    case replaceFont(String, CGFloat)
    
    public var ping: UIFont {
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
        case .replaceFont(let name, let int):
            return UIFont(name: name, size: int)!
        }
    }
    
}


// MARK: 字号
public extension UIFont {
    class func ping(_ state: Flower_FontState) -> UIFont {
        return state.ping
    }
}



