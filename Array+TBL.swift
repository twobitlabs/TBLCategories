
func unwrapOptionals<T>(a: [T]) -> [T] {
    return a
}

func unwrapOptionals<T>(a: [T?]) -> [T] {
    return a.filter { $0 != nil }.map { $0! }
}

extension Array {

    private func typeIsOptional() -> Bool {
        return reflect(self[0]).disposition == .Optional
    }
    
    func contains<U : Equatable>(obj: U) -> Bool {
        if (typeIsOptional()) {
            NSException(name:"Not supported", reason: "Optional Array types not supported", userInfo: nil).raise()
        }

        if isEmpty {
            return false
        }
        
        // if item is an optional, casting it to a non-optional fails
        for item in self.map({ $0 as? U }) { // cast type of array to type of argument to make it equatable
            if item == obj {
                return true
            }
        }
        
        return false
    }
    
    // without this version, contains("foo" as String?) won't compile
    func contains<U : Equatable>(obj: U?) -> Bool {
        if (typeIsOptional()) {
            NSException(name:"Not supported", reason: "Optional Array types not supported", userInfo: nil).raise()
        }

        return obj != nil && contains(obj!)
    }
    
}

