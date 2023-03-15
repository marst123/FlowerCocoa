import Foundation

public extension Link where Base: FontFormat {
    
    /// 字体
    @discardableResult
    func font(_ state: Flower_FontState) -> Link {
        self.base.font(state)
        return self
    }
}


public protocol FontFormat {
    func font(_ state: Flower_FontState)
}

extension Flower_Label: FontFormat {
    public func font(_ state: Flower_FontState) {
        self.font = state.ping
    }
}

extension Flower_Button: FontFormat {
    public func font(_ state: Flower_FontState) {
        self.titleLabel?.font = state.ping
    }
}

extension Flower_TextView: FontFormat {
    public func font(_ state: Flower_FontState) {
        self.font = state.ping
    }
}


extension Flower_TextField: FontFormat {
    public func font(_ state: Flower_FontState) {
        self.font = state.ping
    }
}
