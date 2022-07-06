//
//  LinkCompatible.swift
//  AAAAAA
//
//  Created by Mac on 2021/9/1.
//

import UIKit

public protocol LinkCompatible {
    associatedtype LinkBase
    var link: LinkBase { get }
}

extension LinkCompatible {

    /// Reactive extensions.
    public var link: Link<Self> {
        return Link(self)
    }
}

extension NSObject: LinkCompatible {}
