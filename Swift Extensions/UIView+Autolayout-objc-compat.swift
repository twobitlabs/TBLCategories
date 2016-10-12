import UIKit
/*
    Compatibility methods for our old UIView+Autolayout objc category and objc code that can't pass priority, which is a Float
*/
public extension UIView {
    public func addConstraintsFromDescriptions(constraintDescriptions: [String], views: Dictionary<String, UIView>) -> [NSLayoutConstraint] {
        return addConstraintsFromDescriptions(constraintDescriptions, views: views, metrics: nil)
    }

    public func addConstraintsFromDescriptions(constraintDescriptions: [String], metrics: Dictionary<String, NSNumber>? = nil, views: Dictionary<String, UIView>) -> [NSLayoutConstraint] {
        return addConstraintsFromDescriptions(constraintDescriptions, views: views, metrics: metrics)
    }

    public func objc_pinToTop(identifier: String? = nil) -> NSLayoutConstraint {
        return pinToTop(priority: nil, identifier: identifier)
    }

    public func objc_pinToBottom(identifier: String? = nil) -> NSLayoutConstraint {
        return pinToBottom(priority: nil, identifier: identifier)
    }

    public func objc_pinToLeft(identifier: String? = nil) -> NSLayoutConstraint {
        return pinToLeft(priority: nil, identifier: identifier)
    }

    public func objc_pinToRight(identifier: String? = nil) -> NSLayoutConstraint {
        return pinToRight(priority: nil, identifier: identifier)
    }

    public func objc_insetFromParentLeft(inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentLeft(inset, priority: nil, identifier: identifier)
    }

    public func objc_insetFromParentRight(inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentRight(inset, priority: nil, identifier: identifier)
    }

    public func objc_insetFromParentTop(inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentTop(inset, priority: nil, identifier: identifier)
    }

    func objc_insetFromParentBottom(inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentBottom(inset, priority: nil, identifier: identifier)
    }

    func objc_insetFromParentLeftByAtLeast(inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentLeftByAtLeast(inset, priority: nil, identifier: identifier)
    }

    func objc_insetFromParentRightByAtLeast(inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentRightByAtLeast(inset, priority: nil, identifier: identifier)
    }

    func objc_insetFromParentTopByAtLeast(inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentTopByAtLeast(inset, priority: nil, identifier: identifier)
    }

    public func objc_insetFromParentBottomByAtLeast(inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentBottomByAtLeast(inset, priority: nil, identifier: identifier)
    }

    public func objc_fillParentVertically(identifier: String? = nil) -> [NSLayoutConstraint] {
        return fillParentVertically(priority: nil, identifier: identifier)
    }

    public func objc_fillParentHorizontally(identifier: String? = nil) -> [NSLayoutConstraint] {
        return fillParentHorizontally(priority: nil, identifier: identifier)
    }

    public func objc_centerChildVertically(childView: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return centerChildVertically(childView, priority: nil, identifier: identifier)
    }

    public func objc_setHeightConstraint(size: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return setHeightConstraint(size, priority: nil, identifier: identifier)
    }

    public func objc_setWidthConstraint(size: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return setWidthConstraint(size, priority: nil, identifier: identifier)
    }
}
