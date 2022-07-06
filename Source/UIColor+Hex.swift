//
//  UIColor+Hex.swift
//  gogo
//
//  Created by zhuxiang on 2022/6/21.
//

import UIKit

extension UIColor {
    
    public func toImage() -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
}

extension UIColor {
    
    public convenience init(hexString: String) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        
        if scanner.scanHexInt32(&color) {
            self.init(hex: color, useAlpha: hexString.count > 7)
        }
        else {
            self.init(hex: 0x000000, useAlpha: false)
        }
    }
    
    public convenience init(hex: UInt32, useAlpha alphaChannel: Bool = false) {
        let mask = 0xFF
        
        let r = Int(hex >> (alphaChannel ? 24 : 16)) & mask
        let g = Int(hex >> (alphaChannel ? 16 : 8)) & mask
        let b = Int(hex >> (alphaChannel ? 8 : 0)) & mask
        let a = alphaChannel ? Int(hex) & mask : 255
        
        let red   = CGFloat(r) / 255
        let green = CGFloat(g) / 255
        let blue  = CGFloat(b) / 255
        let alpha = CGFloat(a) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    public final func toHexString() -> String {
        return String(format: "#%06x", toHex())
    }
    
    /**
    Returns the color representation as an integer.
    
    - returns: A UInt32 that represents the hexa-decimal color.
    */
    public final func toHex() -> UInt32 {
        func roundToHex(_ x: CGFloat) -> UInt32 {
            let rounded: CGFloat = round(x * 255)
            
            return UInt32(rounded)
        }
        
        let rgba       = toRGBAComponents()
        let colorToInt = roundToHex(rgba.r) << 16 | roundToHex(rgba.g) << 8 | roundToHex(rgba.b)
        
        return colorToInt
    }
    
    
    public final func toRGBAComponents() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
}
