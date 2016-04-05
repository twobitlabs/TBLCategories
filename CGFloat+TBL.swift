extension CGFloat {
    func roundUpToNearestHalf() -> CGFloat {
        return ceil(self * 2.0) * 0.5
    }
}
