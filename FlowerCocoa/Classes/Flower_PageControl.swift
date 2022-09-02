import UIKit

public typealias Flower_PageControl = UIPageControl

public extension Link where Base: Flower_PageControl {
    
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
