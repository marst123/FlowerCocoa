//
//  PSScrollView.swift
//  gogo
//
//  Created by winnie on 2022/4/27.
//

import UIKit

public typealias PSScrollView = UIScrollView

public extension PSScrollView {
    @discardableResult
    func delegate(_ delegate: UIScrollViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func contentOffset(x: CGFloat, y: CGFloat) -> Self {
        self.contentOffset = CGPoint(x: x, y: y)
        return self
    }
    
    @discardableResult
    func contentSize(width: CGFloat, height: CGFloat) -> Self {
        self.contentSize = CGSize(width: width, height: height)
        return self
    }
    
    @discardableResult
    func contentInset(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Self {
        self.contentInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        self.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }
    
    @discardableResult
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> Self {
        self.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }
    
    @discardableResult
    func bounces(_ bounces: Bool) -> Self {
        self.bounces = bounces
        return self
    }
    
    @discardableResult
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Self {
        self.alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    
    @discardableResult
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Self {
        self.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    
    @discardableResult
    func isPagingEnabled(_ isPagingEnabled: Bool) -> Self {
        self.isPagingEnabled = isPagingEnabled
        return self
    }
    
    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }
    
    @discardableResult
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self {
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    @discardableResult
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self {
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    @discardableResult
    func scrollIndicatorInsets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Self {
        self.scrollIndicatorInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
}
