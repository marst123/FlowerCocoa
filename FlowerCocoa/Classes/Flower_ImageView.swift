import UIKit

public typealias Flower_ImageView = UIImageView


public extension Link where Base: Flower_ImageView {

    @discardableResult
    func image(_ image: UIImage?) -> Link {
        self.base.image = image
        return self
    }
    
    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Link {
        self.base.isHighlighted = isHighlighted
        return self
    }
    
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Link {
        self.base.contentMode = mode
        return self
    }
    
    
}
