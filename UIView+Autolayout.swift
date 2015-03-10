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
    
    func centerChildHorizontally(childView: UIView) -> NSLayoutConstraint {
        childView.setTranslatesAutoresizingMaskIntoConstraints(false)
        let centerHorizontally = NSLayoutConstraint(item: childView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0)
        addConstraint(centerHorizontally)
        return centerHorizontally
    }
    
    func centerChildrenHorizontally(childViews: [UIView]) {
        for view in childViews {
            centerChildHorizontally(view)
        }
    }
    
    func centerChildVertically(childView: UIView) -> NSLayoutConstraint {
        childView.setTranslatesAutoresizingMaskIntoConstraints(false)
        let centerVertically = NSLayoutConstraint(item: childView,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1,
            constant: 0)
        addConstraint(centerVertically)
        return centerVertically
    }

    func centerChild(childView: UIView) -> [NSLayoutConstraint] {
        return [centerChildHorizontally(childView), centerChildVertically(childView)]
    }
    
    // MARK: - positioning
     
    func placeAbove(sibling: UIView, by offset: CGFloat = 0) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        setTranslatesAutoresizingMaskIntoConstraints(false)
        sibling.setTranslatesAutoresizingMaskIntoConstraints(false)
        let bottomOffset = NSLayoutConstraint(item: self,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: .Top,
            multiplier: 1,
            constant: -offset)
        superview.addConstraint(bottomOffset)
        return bottomOffset
    }

    func placeBelow(sibling: UIView, by offset: CGFloat = 0) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
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
        return topOffset
    }

    func placeToRightOf(sibling: UIView, by offset: CGFloat) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
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
        return topOffset
    }

    func placeToLeftOf(sibling: UIView, by offset: CGFloat) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        setTranslatesAutoresizingMaskIntoConstraints(false)
        sibling.setTranslatesAutoresizingMaskIntoConstraints(false)
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: .Left,
            multiplier: 1,
            constant: -offset)
        superview.addConstraint(topOffset)
        return topOffset
    }

    func pinToTop() -> NSLayoutConstraint {
        return pinToEdge(.Top)
    }
    
    func pinToBottom() -> NSLayoutConstraint {
        return pinToEdge(.Bottom)
    }
    
    func pinToLeft() -> NSLayoutConstraint {
        return pinToEdge(.Left)
    }
    
    func pinToRight() -> NSLayoutConstraint {
        return pinToEdge(.Right)
    }
    
    func insetFromParentHorizontally(inset: CGFloat) -> [NSLayoutConstraint] {
        return [pinToEdge(.Left, inset: inset), pinToEdge(.Right, inset: -inset)]
    }

    func insetFromParentVertically(inset: CGFloat) -> [NSLayoutConstraint] {
        return [pinToEdge(.Top, inset: inset), pinToEdge(.Bottom, inset: -inset)]
    }
    
    func insetFromParentLeft(inset: CGFloat) -> NSLayoutConstraint {
        return pinToEdge(.Left, inset: inset)
    }
    
    func insetFromParentRight(inset: CGFloat) -> NSLayoutConstraint {
        return pinToEdge(.Right, inset: -inset)
    }
    
    func insetFromParentTop(inset: CGFloat) -> NSLayoutConstraint {
        return pinToEdge(.Top, inset: inset)
    }
    
    func insetFromParentBottom(inset: CGFloat) -> NSLayoutConstraint {
        return pinToEdge(.Bottom, inset: -inset)
    }
    
    private func pinToEdge(edge: NSLayoutAttribute, inset: CGFloat = 0) -> NSLayoutConstraint {
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
        return pin
    }
    
    func alignVerticallyWith(sibling: UIView) -> NSLayoutConstraint {
        return alignDimension(.CenterY, withSibling: sibling)
    }
    
    func alignHorizontallyWith(sibling: UIView) -> NSLayoutConstraint {
        return alignDimension(.CenterX, withSibling: sibling)
    }

    func matchWidthOf(sibling: UIView) -> NSLayoutConstraint {
        return alignDimension(.Width, withSibling: sibling)
    }

    func matchHeightOf(sibling: UIView) -> NSLayoutConstraint {
        return alignDimension(.Height, withSibling: sibling)
    }
    
    private func alignDimension(dimension: NSLayoutAttribute, withSibling sibling: UIView) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
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
        return align
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

    func setWidthConstraint(size: CGFloat) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .Width)
    }
    
    func setHeightConstraint(size: CGFloat) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .Height)
    }
    
    private func setSizeConstraint(size: CGFloat, dimension: NSLayoutAttribute) -> NSLayoutConstraint {
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
        return widthConstraint
    }

    func matchHeightOfTallest(children: UIView...) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for child in children {
            let constraint = NSLayoutConstraint(item: self,
                attribute: .Bottom,
                relatedBy: .GreaterThanOrEqual,
                toItem: child,
                attribute: .Bottom,
                multiplier: 1,
                constant: 0)
            constraints.append(constraint)
        }
        self.addConstraints(constraints)
        return constraints
    }
    
    func matchParentWidth() -> NSLayoutConstraint {
        return matchParentDimension(.Width)
    }
    
    func matchParentHeight() -> NSLayoutConstraint {
        return matchParentDimension(.Height)
    }
    
    func fillParent() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints += fillParentVertically()
        constraints += fillParentHorizontally()
        return constraints
    }

    func fillParentVertically() -> [NSLayoutConstraint] {
        return [pinToTop(), pinToBottom()]
    }

    func fillParentHorizontally() -> [NSLayoutConstraint] {
        return [pinToLeft(), pinToRight()]
    }
    
    private func matchParentDimension(dimension: NSLayoutAttribute) -> NSLayoutConstraint {
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
        return widthConstraint
    }
}