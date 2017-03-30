import UIKit
/*
    Compatibility methods for our old UIView+Autolayout objc category and objc code that can't pass priority, which is a Float
*/
public extension UIView {
    @discardableResult public func addConstraintsFromDescriptions(_ constraintDescriptions: [String], views: Dictionary<String, UIView>) -> [NSLayoutConstraint] {
        return addConstraintsFromDescriptions(constraintDescriptions, views: views, metrics: nil)
    }

    @discardableResult public func addConstraintsFromDescriptions(_ constraintDescriptions: [String], metrics: Dictionary<String, NSNumber>? = nil, views: Dictionary<String, UIView>) -> [NSLayoutConstraint] {
        return addConstraintsFromDescriptions(constraintDescriptions, views: views, metrics: metrics)
    }

    @discardableResult public func objc_pinToTop(identifier: String? = nil) -> NSLayoutConstraint {
        return pinToTop(priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_pinToBottom(identifier: String? = nil) -> NSLayoutConstraint {
        return pinToBottom(priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_pinToLeft(identifier: String? = nil) -> NSLayoutConstraint {
        return pinToLeft(priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_pinToRight(identifier: String? = nil) -> NSLayoutConstraint {
        return pinToRight(priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_insetFromParentLeft(_ inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentLeft(inset, priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_insetFromParentRight(_ inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentRight(inset, priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_insetFromParentTop(_ inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentTop(inset, priority: nil, identifier: identifier)
    }

    @discardableResult func objc_insetFromParentBottom(_ inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentBottom(inset, priority: nil, identifier: identifier)
    }

    @discardableResult func objc_insetFromParentLeftByAtLeast(_ inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentLeftByAtLeast(inset, priority: nil, identifier: identifier)
    }

    @discardableResult func objc_insetFromParentRightByAtLeast(_ inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentRightByAtLeast(inset, priority: nil, identifier: identifier)
    }

    @discardableResult func objc_insetFromParentTopByAtLeast(_ inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentTopByAtLeast(inset, priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_insetFromParentBottomByAtLeast(_ inset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return insetFromParentBottomByAtLeast(inset, priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_fillParentVertically(identifier: String? = nil) -> [NSLayoutConstraint] {
        return fillParentVertically(priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_fillParentHorizontally(identifier: String? = nil) -> [NSLayoutConstraint] {
        return fillParentHorizontally(priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_centerChildVertically(_ childView: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return centerChildVertically(childView, priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_setHeightConstraint(_ size: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return setHeightConstraint(size, priority: nil, identifier: identifier)
    }

    @discardableResult public func objc_setWidthConstraint(_ size: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        return setWidthConstraint(size, priority: nil, identifier: identifier)
    }
}
