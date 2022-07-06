//
//  Link.swift
//  AAAAAA
//
//  Created by Mac on 2021/9/1.
//

import Foundation

public struct Link<Base> {
    /// Base object to extend.
    public let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}


