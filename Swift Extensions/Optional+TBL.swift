
extension Optional {
    var hasValue: Bool {
        get {
            switch self {
                case .none:
                    return false
                case .some:
                    return true
            }
        }
    }
}

protocol CanBeEmpty {
    var isEmpty: Bool { get }
}

extension String: CanBeEmpty {}
extension Dictionary: CanBeEmpty {}
extension Array: CanBeEmpty {}

extension Optional where Wrapped : CanBeEmpty {
    var isEmpty: Bool {
        get {
            switch self {
            case .none:
                return true
            case .some(let maybeEmpty):
                return maybeEmpty.isEmpty
            }
        }
    }
}

protocol CanHaveNonEmptyValue {
    var hasNonEmptyValue: Bool { get }
}

extension String: CanHaveNonEmptyValue {}

extension Optional where Wrapped: CanHaveNonEmptyValue {
    var hasNonEmptyValue: Bool {
        get {
            switch self {
            case .none:
                return true
            case .some(let maybeEmpty):
                return maybeEmpty.hasNonEmptyValue
            }
        }
    }
}
