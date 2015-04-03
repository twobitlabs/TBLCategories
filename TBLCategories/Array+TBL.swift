import Foundation

public func unwrapOptionals<T>(a: [T]) -> [T] {
    return a
}

public func unwrapOptionals<T>(a: [T?]) -> [T] {
    return a.filter { $0 != nil }.map { $0! }
}

extension Array {

    private func typeIsOptional() -> Bool {
        return reflect(self[0]).disposition == .Optional
    }
    
    func contains<U : Equatable>(obj: U) -> Bool {
        if isEmpty {
            return false
        }

        if (typeIsOptional()) {
            NSException(name:"Not supported", reason: "Optional Array types not supported", userInfo: nil).raise()
        }
        
        // cast type of array to type of argument to make it equatable
        for item in self.map({ $0 as? U }) {
            if item == obj {
                return true
            }
        }
        
        return false
    }
    
    // without this version, contains("foo" as String?) won't compile
    func contains<U : Equatable>(obj: U?) -> Bool {
        if isEmpty {
            return false
        }

        if (typeIsOptional()) {
            NSException(name:"Not supported", reason: "Optional Array types not supported", userInfo: nil).raise()
        }

        return obj != nil && contains(obj!)
    }
    
}

