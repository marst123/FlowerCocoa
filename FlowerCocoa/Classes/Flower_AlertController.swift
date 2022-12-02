import Foundation
import UIKit


public extension Link where Base: Flower_AlertController {
    
    // 具有初始化方法 convenience init
    
    func setTitle(_ title: String?) -> Link {
        self.base.title = title
        return self
    }
    
    func setMessage(_ message: String?) -> Link {
        self.base.message = message
        return self
    }

    /// 添加按钮
    /// - UIAlertActionStyle - sheet : `default` 默认类型,常规按钮样式 `cancel` 取消类型,加粗位于最下方按钮 `destructive` 销毁类型,红色显示
    /// - UIAlertActionStyle - alert : `default` 默认类型,常规按钮样式 `cancel` 取消类型,加粗位于最后方按钮 `destructive` 销毁类型,红色显示
    /// - Returns:
    func addAction(_ action: UIAlertAction) -> Link {
        self.base.addAction(action)
        return self
    }
    
    func addActionHandle(action title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)? = nil) -> Link {
        let alert = UIAlertAction(title: title, style: style, handler: handler)
        self.base.addAction(alert)
        return self
    }
    
}


public extension Link where Base: Flower_AlertAction {
    
    // 具有初始化方法 convenience init
    
    func isEnabled(_ enabled: Bool) -> Link {
        self.base.isEnabled = enabled
        return self
    }
    
}
