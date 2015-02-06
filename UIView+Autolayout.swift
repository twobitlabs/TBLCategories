import UIKit

extension UIView {

    func addConstraintsFromDescriptions(constraintDescriptions: [String], views: Dictionary<String, UIView>, options: NSLayoutFormatOptions = NSLayoutFormatOptions.allZeros, metrics: Dictionary<String, NSNumber>? = nil) {
        for view in views.values {
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
        }
        for constraintDescription in constraintDescriptions {
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(constraintDescription, views: views, options:options, metrics:metrics))
        }
    }
    
    // MARK: - centering
    
    func centerChildHorizontally(childView: UIView) {
        childView.setTranslatesAutoresizingMaskIntoConstraints(false)
        let centerHorizontally = NSLayoutConstraint(item: childView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0)
        addConstraint(centerHorizontally)
    }
    
    func centerChildrenHorizontally(childViews: [UIView]) {
        for view in childViews {
            centerChildHorizontally(view)
        }
    }
    
    func centerChildVertically(childView: UIView) {
        childView.setTranslatesAutoresizingMaskIntoConstraints(false)
        let centerVertically = NSLayoutConstraint(item: childView,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1,
            constant: 0)
        addConstraint(centerVertically)
    }

    func centerChild(childView: UIView) {
        centerChildHorizontally(childView)
        centerChildVertically(childView)
    }
    
    // MARK: - positioning
    
    func offsetTopFromParent(offset: CGFloat) {
        let superview = self.superview!
        setTranslatesAutoresizingMaskIntoConstraints(false)
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: superview,
            attribute: .Top,
            multiplier: 1,
            constant: offset)
        superview.addConstraint(topOffset)
    }
    
    func placeBelow(sibling: UIView, by offset: CGFloat) {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            return
        }
        setTranslatesAutoresizingMaskIntoConstraints(false)
        sibling.setTranslatesAutoresizingMaskIntoConstraints(false)
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: .Bottom,
            multiplier: 1,
            constant: offset)
        superview.addConstraint(topOffset)
    }
    
    func pinToTop() {
        let superview = self.superview!
        setTranslatesAutoresizingMaskIntoConstraints(false)
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: superview,
            attribute: .Top,
            multiplier: 1,
            constant: 0)
        superview.addConstraint(topOffset)
    }
    
    func pinToBottom() {
        let superview = self.superview!
        setTranslatesAutoresizingMaskIntoConstraints(false)
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: superview,
            attribute: .Bottom,
            multiplier: 1,
            constant: 0)
        superview.addConstraint(topOffset)
    }
    
    // MARK: - sizing

    func setWidthConstraint(size: CGFloat) {
        setSizeConstraint(size, dimension: .Width)
    }
    
    func setHeightConstraint(size: CGFloat) {
        setSizeConstraint(size, dimension: .Height)
    }
    
    private func setSizeConstraint(size: CGFloat, dimension: NSLayoutAttribute) {
        let superview = self.superview!
        setTranslatesAutoresizingMaskIntoConstraints(false)
        let widthConstraint = NSLayoutConstraint(item: self,
            attribute: dimension,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: size)
        superview.addConstraint(widthConstraint)
    }
    
    func matchParentWidth() {
        matchParentDimension(.Width)
    }
    
    func matchParentHeight() {
        matchParentDimension(.Height)
    }
    
    private func matchParentDimension(dimension: NSLayoutAttribute) {
        let superview = self.superview!
        setTranslatesAutoresizingMaskIntoConstraints(false)
        let widthConstraint = NSLayoutConstraint(item: self,
            attribute: dimension,
            relatedBy: .Equal,
            toItem: superview,
            attribute: dimension,
            multiplier: 1,
            constant: 0)
        superview.addConstraint(widthConstraint)
    }
}