import UIKit


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
    
    
}
