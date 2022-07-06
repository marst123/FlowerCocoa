//
//  PSCollectionView.swift
//  gogo
//
//  Created by winnie on 2022/5/5.
//

import UIKit

public typealias PSCollectionView = UICollectionView

public extension Link where Base: PSCollectionView {
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
    func register(_ nib: UINib?, identifier: String) -> Link {
        self.base.register(nib, forCellWithReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) -> Link {
        self.base.register(T.self, forCellWithReuseIdentifier: String(describing: name))
        return self
    }
    
    @discardableResult
    func register(_ nibArr: [UINib?]) -> Link {
        nibArr.forEach { (nibName) in
            let nameStr = nibName!.description
            print("nib注册Name: \(nameStr)")
            self.register(nibName, identifier: nameStr)
        }
        return self
    }
    
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
    func registerHeader(_ viewClass: Swift.AnyClass?,
                  forSectionHeaderWithReuseIdentifier identifier: String) -> Link {
        self.base.register(viewClass,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: identifier)
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
