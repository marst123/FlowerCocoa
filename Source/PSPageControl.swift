//
//  PSPageControl.swift
//  gogo
//
//  Created by zhuxiang on 2022/6/2.
//

import UIKit

public typealias PSPageControl = UIPageControl

public extension Link where Base: PSPageControl {
    
    @discardableResult
    func currentPage(_ currentPage: Int) -> Link {
        self.base.currentPage = currentPage
        return self
    }
    
    @discardableResult
    func numberOfPages(_ numberOfPages: Int) -> Link {
        self.base.numberOfPages = numberOfPages
        return self
    }
    
    /// 未选中颜色
    @discardableResult
    func tintColor(_ color: UIColor) -> Link {
        self.base.pageIndicatorTintColor = color
        return self
    }
    
    /// 选中颜色
    @discardableResult
    func currentTintColor(_ color: UIColor) -> Link {
        self.base.currentPageIndicatorTintColor = color
        return self
    }
    
    
}
