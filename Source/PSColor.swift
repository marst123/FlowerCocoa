//
//  PSColor.swift
//  gogo
//
//  Created by Mac on 2022/4/25.
//

import UIKit

public typealias PSColor = UIColor

public extension PSColor {

    class func hex(_ color: String) -> UIColor {
        return PSColorMode.hex(color).color
    }
    
    class func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat,_ alpha: CGFloat) -> UIColor {
        return PSColorMode.rgb(r, g, b, alpha).color
    }
    
    class func hexCG(_ color: String) -> CGColor {
        return hex(color).cgColor
    }
    
    class func rgbCG(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat,_ alpha: CGFloat) -> CGColor {
        return rgb(r, g, b, alpha).cgColor
    }
    
}

public enum PSColorMode {
    case rgb(CGFloat, CGFloat, CGFloat, CGFloat)
    case hex(String)
    
    var color: UIColor {
        switch self {
        case .rgb(let r, let g, let b, let alpha):
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        case .hex(let string):
            return UIColor(hexString: string)
        }
    }
}

