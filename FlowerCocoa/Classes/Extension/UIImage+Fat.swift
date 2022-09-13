import UIKit


public enum Flower_FindImageWay {
    case name(String)       // 名字
    case path(String)       // 路径
    case data(Data)         // 二进制Data流
    
}

public extension UIImage {
    
    class func findImage(_ way: Flower_FindImageWay) -> UIImage? {
        switch way {
        case .name(let string):
            return UIImage(named: string)
        case .path(let string):
            return UIImage(contentsOfFile: string)
        case .data(let data):
            return UIImage(data: data)
        }
    }
}
