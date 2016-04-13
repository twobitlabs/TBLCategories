// MARK: - Null Coalesce & Assignment Operator

infix operator ??= { associativity left precedence 90 }

/**
 If the left-hand side is nil, assign to the value of the right-hand side.
 */
public func ??= <T>(inout lhs: T, rhs: T?) {
  if lhs == nil {
      lhs = rhs
  }
}
