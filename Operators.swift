// MARK: - Null Coalesce & Assignment Operator

infix operator ??= { associativity left precedence 90 }

// If the right-hand side is NOT nil, the left-hand side is set to the value of the right-hand side.
// If the right-hand side is nil, no change is made to the left-hand side.
func ??= <T>(inout lhs: T, rhs: T?) {
    if let rhs = rhs {
        lhs = rhs
    }
}