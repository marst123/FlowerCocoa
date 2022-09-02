import UIKit

public typealias Flower_CollectionView = UICollectionView

public typealias Flower_CollectionViewFlowLayout = UICollectionViewFlowLayout

public extension Link where Base: Flower_CollectionView {
    @discardableResult
    func dataSource(_ dataSource: UICollectionViewDataSource?) -> Link {
        self.base.dataSource = dataSource
        return self
    }
    
    @discardableResult
    func delegate(_ delegate: UICollectionViewDelegate?) -> Link {
        self.base.delegate = delegate
        return self
    }
    
    @discardableResult
    func register<T: UICollectionViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle?

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        self.base.register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) -> Link {
        self.base.register(T.self, forCellWithReuseIdentifier: String(describing: name))
        return self
    }
    
//    @discardableResult
//    func register(_ nibArr: [UINib?]) -> Link {
//        nibArr.forEach { (nibName) in
//            let nameStr = nibName!.description
//            print("nib注册Name: \(nameStr)")
//            self.register(nibWithCellClass: <#T##T.Type#>, at: <#T##AnyClass?#>)
//            self.register(nibName, identifier: nameStr)
//        }
//        return self
//    }
    
    @discardableResult
    func register<T: UICollectionViewCell>(_ cellClassArr: [T.Type]) -> Link {
        cellClassArr.forEach { cellClass in
            print("cellClass注册Name: \(NSStringFromClass(cellClass))")
            self.register(cellWithClass: cellClass)
        }
        return self
    }
    
    @discardableResult
    func registerHeader(_ nib: UINib?,
                  forSectionHeaderWithReuseIdentifier identifier: String) -> Link {
        self.base.register(nib,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: identifier)
        return self
    }
    
    
    
    @discardableResult
    func registerHeader<T: UICollectionReusableView>(_ viewClass: T.Type) -> Link {
        self.base.register(viewClass.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: String(describing: viewClass))
        return self
    }
    
    @discardableResult
    func registerFooter(_ nib: UINib?,
                  forSectionFooterWithReuseIdentifier identifier: String) -> Link {
        self.base.register(nib,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                      withReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func registerFooter(_ viewClass: Swift.AnyClass?,
                  forSectionFooterWithReuseIdentifier identifier: String) -> Link {
        self.base.register(viewClass,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                      withReuseIdentifier: identifier)
        return self
    }
    
}



public extension Link where Base: Flower_CollectionViewFlowLayout {
    
    @discardableResult
    func scrollDirection(_ direction: UICollectionView.ScrollDirection) -> Link {
        self.base.scrollDirection = direction
        return self
    }
    
    @discardableResult
    func itemSize(_ size: CGSize) -> Link {
        self.base.itemSize = size
        return self
    }
    
    @discardableResult
    func minSpacing(lineSpacing: CGFloat? = nil, itemSpacing: CGFloat? = nil) -> Link {
        if let lineSpacing = lineSpacing {
            self.base.minimumLineSpacing = lineSpacing
        }
        if let itemSpacing = itemSpacing {
            self.base.minimumInteritemSpacing = itemSpacing
        }
        return self
    }
    
    @discardableResult
    func estimatedItemSize(_ size: CGSize) -> Link {
        self.base.estimatedItemSize = size
        return self
    }
    
    
}

