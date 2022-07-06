//
//  PSblock.swift
//  CampYouXi
//
//  Created by Mac on 2022/3/28.
//

import Foundation

public typealias LabClosure = ((PSLabel) -> Void)

public typealias BtnClosure = ((PSButton) -> Void)

public typealias TFClosure = ((PSTextField) -> Void)

public typealias StackViewClosure = ((PSStackView) -> Void)

public typealias ViewClosure = ((PSView) -> Void)

public typealias NullHandler = (() -> Void)

public typealias IntHandler = ((Int) -> Void)

public typealias StringHandler = ((String) -> Void)

public typealias AnyHandler = ((Any?) -> Void)
