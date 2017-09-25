import UIKit

open class InsetTextField: UITextField {
    var insets: UIEdgeInsets

    init(insets: UIEdgeInsets) {
        self.insets = insets
        super.init(frame: CGRect.zero)
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("not implemented for use in a NIB")
    }

    // placeholder position
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return super.textRect(forBounds: UIEdgeInsetsInsetRect(bounds, insets))
    }

    // text position
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return super.editingRect(forBounds: UIEdgeInsetsInsetRect(bounds, insets))
    }
}

public extension UITextField {

    public var isEmpty: Bool {
        get {
            return textOrEmptyString.isEmpty
        }
    }

    public var textOrEmptyString: String {
        get {
            return text ?? ""
        }
    }

    public class func textFieldWithInsets(_ insets: UIEdgeInsets) -> UITextField {
        return InsetTextField(insets: insets)
    }

}
