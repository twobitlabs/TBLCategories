
private class InsetTextField: UITextField {
    var insets: UIEdgeInsets

    init(insets: UIEdgeInsets) {
        self.insets = insets
        super.init(frame: CGRectZero)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func inset(bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x + insets.left,
            y: bounds.origin.y + insets.top,
            width: bounds.size.width - insets.right,
            height: bounds.size.height - insets.bottom
        )
    }

    // placeholder position
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return inset(bounds)
    }

    // text position
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return inset(bounds)
    }
}

extension UITextField {

    class func textFieldWithInsets(insets: UIEdgeInsets) -> UITextField {
        return InsetTextField(insets: insets)
    }

}