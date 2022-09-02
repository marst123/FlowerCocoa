import UIKit

public typealias Flower_TableView = UITableView

public extension Link where Base: Flower_TableView {
    
    @discardableResult
    func dataSource(_ dataSource: UITableViewDataSource?) -> Link {
        self.base.dataSource = dataSource
        return self
    }
    
    @discardableResult
    func delegate(_ delegate: UITableViewDelegate?) -> Link {
        self.base.delegate = delegate
        return self
    }
    
    @discardableResult
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(nib: UINib?, withHeaderFooterViewClass name: T.Type) -> Link {
        self.base.register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
        return self
    }
    
    @discardableResult
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ name: T.Type) -> Link {
        self.base.register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
        return self
    }
    
    @discardableResult
    func register<T: UITableViewCell>(nibClass name: T.Type, at bundleClass: AnyClass? = nil) -> Link {
        let identifier = String(describing: name)
        var bundle: Bundle?

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        self.base.register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
        return self
    }

    @discardableResult
    func register<T: UITableViewCell>(cellWithClass name: T.Type) -> Link {
        self.base.register(T.self, forCellReuseIdentifier: String(describing: name))
        return self
    }
    
//    @discardableResult
//    func register(_ nibArr: [UINib?]) -> Link {
//        nibArr.forEach { (nibName) in
//            let nameStr = nibName!.description
//            print("nib注册Name: \(nameStr)")
//            self.register(nibName, identifier: nameStr)
//        }
//        return self
//    }
    
    @discardableResult
    func register<T: UITableViewCell>(_ cellClassArr: [T.Type]) -> Link {
        cellClassArr.forEach { cellClass in
            print("cellClass注册Name: \(NSStringFromClass(cellClass))")
            self.register(cellWithClass: cellClass)
        }
        return self
    }
    
    @discardableResult
    func rowHeight(_ rowHeight: CGFloat) -> Link {
        self.base.rowHeight = rowHeight
        return self
    }
    
    @discardableResult
    func separator(_ separatorStyle: UITableViewCell.SeparatorStyle) -> Link {
        self.base.separatorStyle = separatorStyle
        return self
    }
    
    @discardableResult
    func headerView(_ headerView: UIView?) -> Link {
        self.base.tableHeaderView = headerView
        return self
    }
    
    @discardableResult
    func footerView(_ footerView: UIView?) -> Link {
        self.base.tableFooterView = footerView
        return self
    }
    
}
