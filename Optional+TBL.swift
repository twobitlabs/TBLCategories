
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