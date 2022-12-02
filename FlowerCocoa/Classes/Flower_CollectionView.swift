import UIKit


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
    func register<T: UICollectionViewCell>(nibClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle? = nil

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        self.base.register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func register<T: UICollectionViewCell>(viewClass name: T.Type) -> Link {
        let identifier = String(describing: name)
        self.base.register(T.self, forCellWithReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    private func registerHeader<T: UICollectionReusableView>(nibClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle? = nil

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        self.base.register(UINib(nibName: identifier, bundle: bundle),
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func registerHeader<T: UICollectionReusableView>(viewClass name: T.Type) -> Link {
        let identifier = String(describing: name)
        self.base.register(name.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    private func registerFooter<T: UICollectionReusableView>(nibClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle? = nil

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        self.base.register(UINib(nibName: identifier, bundle: bundle),
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                      withReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func registerFooter<T: UICollectionReusableView>(viewClass name: T.Type) -> Link {
        let identifier = String(describing: name)
        self.base.register(name.self,
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
    func estimatedItem(_ size: CGSize) -> Link {
        self.base.estimatedItemSize = size
        return self
    }
    
    
}
