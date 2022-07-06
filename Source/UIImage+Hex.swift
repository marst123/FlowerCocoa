//
//  UIImage+Hex.swift
//  gogo
//
//  Created by zhuxiang on 2022/6/27.
//

import UIKit

public enum PSFindImageWay {
    case name(String)       // 名字
    case path(String)       // 路径
    case data(Data)         // 二进制Data流
    
}

extension UIImage {
    
    func findImage(_ findWay: PSFindImageWay) -> UIImage? {
        switch findWay {
        case .name(let string):
            return UIImage(named: string)
        case .path(let string):
            return UIImage(contentsOfFile: string)
        case .data(let data):
            return UIImage(data: data)
        }
    }
}
