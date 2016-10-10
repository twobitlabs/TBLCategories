// MARK: - Null Coalesce & Assignment Operator

infix operator ??= : AssignmentPrecedence




/**
 If the left-hand side is nil, assign to the value of the right-hand side.
 */
public func ??= <T>(lhs: inout T?, rhs: T?) {
  if lhs == nil {
      lhs = rhs
  }
}
