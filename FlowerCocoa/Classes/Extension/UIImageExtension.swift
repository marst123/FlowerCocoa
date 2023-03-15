import UIKit


// MARK: Image查找方式
public extension UIImage {
    
    class func findName(_ name: String) -> UIImage? {
        return UIImage(named: name)
    }
    
    class func findData(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    class func findPath(_ filePath: String) -> UIImage? {
        return UIImage(contentsOfFile: filePath)
    }
}

