extension CGFloat {
    @available(*, deprecated, message: "Use UIDevice.scale instead")
    func roundUpToNearestHalf() -> CGFloat {
        return ceil(self * 2.0) * 0.5
    }
}
