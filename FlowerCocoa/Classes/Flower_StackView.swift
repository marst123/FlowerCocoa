import UIKit

public typealias Flower_StackView = UIStackView

public extension Link where Base: Flower_StackView {
    
    @discardableResult
    func label(_ closure: BlockHandler<UILabel>? = nil) -> Link {
        let view = UILabel()
        self.base.addArrangedSubview(view)
        closure?(view)
        return self
    }

    @discardableResult
    func button(_ closure: BlockHandler<UIButton>? = nil) -> Link {
        let view = UIButton()
        self.base.addArrangedSubview(view)
        closure?(view)
        return self
    }
    
    @discardableResult
    func textField(_ closure: BlockHandler<UITextField>? = nil) -> Link {
        let view = UITextField()
        self.base.addArrangedSubview(view)
        closure?(view)
        return self
    }

    @discardableResult
    func stackView(closure: @escaping BlockHandler<UIStackView>) -> Link {
        let view = UIStackView()
        self.base.addArrangedSubview(view)
        closure(view)
        return self
    }
    
    @discardableResult
    func imageView(closure: @escaping BlockHandler<UIImageView>) -> Link {
        let view = UIImageView()
        self.base.addArrangedSubview(view)
        closure(view)
        return self
    }
    
    
    @discardableResult
    func arranged(_ subviews: [UIView]) -> Link {
        subviews.forEach { view in
            self.base.addArrangedSubview(view)
        }
        return self
    }
    
    @discardableResult
    func config(_ axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat) -> Link {
        self.base.axis = axis
        self.base.alignment = alignment
        self.base.distribution = distribution
        self.base.spacing = spacing
        return self
    }

}
