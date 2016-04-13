
extension Optional {
    var hasValue: Bool {
        get {
            switch self {
                case .None:
                    return false
                case .Some:
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
            case .None:
                return true
            case .Some(let maybeEmpty):
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
            case .None:
                return true
            case .Some(let maybeEmpty):
                return maybeEmpty.hasNonEmptyValue
            }
        }
    }
}