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
     
    func placeBelow(sibling: UIView, by offset: CGFloat = 0) {
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
    
    func placeToRightOf(sibling: UIView, by offset: CGFloat) {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            return
        }
        setTranslatesAutoresizingMaskIntoConstraints(false)
        sibling.setTranslatesAutoresizingMaskIntoConstraints(false)
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: .Right,
            multiplier: 1,
            constant: offset)
        superview.addConstraint(topOffset)
    }
    
    func pinToTop() {
        pinToEdge(.Top)
    }
    
    func pinToBottom() {
        pinToEdge(.Bottom)
    }
    
    func pinToLeft() {
        pinToEdge(.Left)
    }
    
    func pinToRight() {
        pinToEdge(.Right)
    }
    
    func insetFromParentHorizontally(inset: CGFloat) {
        pinToEdge(.Left, inset: inset)
        pinToEdge(.Right, inset: -inset)
    }

    func insetFromParentVertically(inset: CGFloat) {
        pinToEdge(.Top, inset: inset)
        pinToEdge(.Bottom, inset: -inset)
    }
    
    func insetFromParentLeft(inset: CGFloat) {
        pinToEdge(.Left, inset: inset)
    }
    
    func insetFromParentRight(inset: CGFloat) {
        pinToEdge(.Right, inset: -inset)
    }
    
    func insetFromParentTop(inset: CGFloat) {
        pinToEdge(.Top, inset: inset)
    }
    
    func insetFromParentBottom(inset: CGFloat) {
        pinToEdge(.Bottom, inset: -inset)
    }
    
    private func pinToEdge(edge: NSLayoutAttribute, inset: CGFloat = 0) {
        let superview = self.superview!
        setTranslatesAutoresizingMaskIntoConstraints(false)
        let pin = NSLayoutConstraint(item: self,
            attribute: edge,
            relatedBy: .Equal,
            toItem: superview,
            attribute: edge,
            multiplier: 1,
            constant: inset)
        superview.addConstraint(pin)
    }
    
    func alignVerticallyWith(sibling: UIView) {
        alignDimension(.CenterY, withSibling: sibling)
    }
    
    func alignHorizontallyWith(sibling: UIView) {
        alignDimension(.CenterX, withSibling: sibling)
    }
    
    private func alignDimension(dimension: NSLayoutAttribute, withSibling sibling: UIView) {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            return
        }
        setTranslatesAutoresizingMaskIntoConstraints(false)
        sibling.setTranslatesAutoresizingMaskIntoConstraints(false)
        let align = NSLayoutConstraint(item: self,
            attribute: dimension,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: dimension,
            multiplier: 1,
            constant: 0)
        superview.addConstraint(align)
    }
    
    // TODO: this only works if the superview is centered in its superview.
    // Can't use superview.Width as you can't base child's .CenterX on it
    // http://stackoverflow.com/questions/13867736/why-is-nslayoutattributecenterx-an-invalid-pairing-with-nslayoutattributewidth
    func distributeHorizontally(children: [UIView]) {
        if children.isEmpty {
            return
        }
        
        let superview = children[0].superview!
        for child in children {
            if child.superview != superview {
                return
            }
        }
        
        for (index, child) in enumerate(children) {
            child.setTranslatesAutoresizingMaskIntoConstraints(false)
            let multiplier = CGFloat((Float(index) + 0.5) * 2 / Float(children.count))
            let align = NSLayoutConstraint(item: child,
                attribute: .CenterX,
                relatedBy: .Equal,
                toItem: self,
                attribute: .CenterX,
                multiplier: multiplier,
                constant: 0)
            superview.addConstraint(align)
        }
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
    
    func fillParent() {
        pinToTop()
        pinToBottom()
        pinToLeft()
        pinToRight()
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