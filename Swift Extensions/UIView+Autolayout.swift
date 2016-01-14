import UIKit

public extension UIView {

    public func addConstraintsFromDescriptions(constraintDescriptions: [String], views: Dictionary<String, UIView>, options: NSLayoutFormatOptions = NSLayoutFormatOptions(), metrics: Dictionary<String, NSNumber>? = nil) -> [NSLayoutConstraint] {
        for view in views.values {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = [NSLayoutConstraint]()
        for constraintDescription in constraintDescriptions {
            constraints += NSLayoutConstraint.constraintsWithVisualFormat(constraintDescription, views: views, options:options, metrics:metrics)
        }
        NSLayoutConstraint.activateConstraints(constraints)
        return constraints
    }
    
    // MARK: - centering
    
    public func centerChildHorizontally(childView: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        childView.translatesAutoresizingMaskIntoConstraints = false
        let centerHorizontally = NSLayoutConstraint(item: childView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0)
        centerHorizontally.identifier = identifier
        centerHorizontally.active = true
        return centerHorizontally
    }
    
    public func centerChildrenHorizontally(childViews: [UIView], identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in childViews {
            constraints.append(centerChildHorizontally(view, identifier: identifier))
        }
        return constraints
    }
    
    public func centerChildVertically(childView: UIView, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        childView.translatesAutoresizingMaskIntoConstraints = false
        let centerVertically = NSLayoutConstraint(item: childView,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1,
            constant: 0)
        if let priority = priority {
            centerVertically.priority = priority
        }
        centerVertically.active = true
        centerVertically.identifier = identifier
        return centerVertically
    }

    public func centerChildrenVertically(childViews: [UIView], identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in childViews {
            constraints.append(centerChildVertically(view, identifier: identifier))
        }
        return constraints
    }

    public func centerChild(childView: UIView) -> [NSLayoutConstraint] {
        return [centerChildHorizontally(childView), centerChildVertically(childView)]
    }

    private func centerSibling(sibling: UIView, onDimension dimension: NSLayoutAttribute, identifier: String? = nil)  -> NSLayoutConstraint {
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let centerConstraint = NSLayoutConstraint(item: sibling,
            attribute: dimension,
            relatedBy: .Equal,
            toItem: self,
            attribute: dimension,
            multiplier: 1,
            constant: 0)
        centerConstraint.active = true
        centerConstraint.identifier = identifier
        return centerConstraint
    }

    public func centerSiblingHorizontally(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint  {
        return centerSibling(sibling, onDimension: .CenterX, identifier: identifier)
    }
    
    public func centerSiblingVertically(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint  {
        return centerSibling(sibling, onDimension: .CenterY, identifier: identifier)
    }

    public func centerSibling(sibling: UIView, identifier: String? = nil) -> [NSLayoutConstraint]  {
        return [centerSiblingHorizontally(sibling, identifier: identifier), centerSiblingVertically(sibling, identifier: identifier)]
    }

    // MARK: - positioning
     
    public func placeAbove(sibling: UIView, by offset: CGFloat = 0, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let bottomOffset = NSLayoutConstraint(item: self,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: .Top,
            multiplier: 1,
            constant: -offset)
        bottomOffset.active = true
        bottomOffset.identifier = identifier
        return bottomOffset
    }

    public func placeBelow(sibling: UIView, by offset: CGFloat = 0, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: .Bottom,
            multiplier: 1,
            constant: offset)
        topOffset.active = true
        topOffset.identifier = identifier
        return topOffset
    }

    /**
        Add a `NSLayoutConstraint` that positions the caller at least `offset` points below `sibling`
    
        :returns: The constraint that was added to the caller's superview
    */
    public func placeBelow(sibling: UIView, byAtLeast offset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .Top,
            relatedBy: .GreaterThanOrEqual,
            toItem: sibling,
            attribute: .Bottom,
            multiplier: 1,
            constant: offset)
        topOffset.active = true
        topOffset.identifier = identifier
        return topOffset
    }

    public func placeToRightOf(sibling: UIView, by offset: CGFloat = 0, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let rightOffset = NSLayoutConstraint(item: self,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: .Right,
            multiplier: 1,
            constant: offset)
        rightOffset.active = true
        rightOffset.identifier = identifier
        return rightOffset
    }

    /**
        Add a `NSLayoutConstraint` that positions the caller at least `offset` points to the right of `sibling`

        :returns: The constraint that was added to the caller's superview
    */
    public func placeToRightOf(sibling: UIView, byAtLeast offset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let rightOffset = NSLayoutConstraint(item: self,
            attribute: .Left,
            relatedBy: .GreaterThanOrEqual,
            toItem: sibling,
            attribute: .Right,
            multiplier: 1,
            constant: offset)
        rightOffset.active = true
        rightOffset.identifier = identifier
        return rightOffset
    }

    public func placeToLeftOf(sibling: UIView, by offset: CGFloat = 0, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let leftOffset = NSLayoutConstraint(item: self,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: .Left,
            multiplier: 1,
            constant: -offset)
        leftOffset.active = true
        leftOffset.identifier = identifier
        return leftOffset
    }

    /**
    Add a `NSLayoutConstraint` that positions the caller at least `offset` points to the left of `sibling`

    :returns: The constraint that was added to the caller's superview
    */
    public func placeToLeftOf(sibling: UIView, byAtLeast offset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let leftOffset = NSLayoutConstraint(item: self,
            attribute: .Right,
            relatedBy: .LessThanOrEqual,
            toItem: sibling,
            attribute: .Left,
            multiplier: 1,
            constant: -offset)
        leftOffset.active = true
        leftOffset.identifier = identifier
        return leftOffset
    }

    public func pinToTop(priority priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Top, priority: priority, identifier: identifier)
    }
    
    public func pinToBottom(priority priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Bottom, priority: priority, identifier: identifier)
    }
    
    public func pinToLeft(priority priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Left, priority: priority, identifier: identifier)
    }
    
    public func pinToRight(priority priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Right, priority: priority, identifier: identifier)
    }
    
    public func insetFromParent(inset: CGFloat, identifier: String? = nil) -> [NSLayoutConstraint] {
        return insetFromParentVertically(inset, identifier: identifier) + insetFromParentHorizontally(inset, identifier: identifier)
    }

    public func insetFromParentHorizontally(inset: CGFloat, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToEdge(.Left, inset: inset, identifier: identifier), pinToEdge(.Right, inset: -inset, identifier: identifier)]
    }

    public func insetFromParentVertically(inset: CGFloat, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToEdge(.Top, inset: inset, identifier: identifier), pinToEdge(.Bottom, inset: -inset, identifier: identifier)]
    }
    
    public func insetFromParentLeft(inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Left, inset: inset, priority: priority, identifier: identifier)
    }
    
    public func insetFromParentRight(inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Right, inset: -inset, priority: priority, identifier: identifier)
    }
    
    public func insetFromParentTop(inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Top, inset: inset, priority: priority, identifier: identifier)
    }
    
    func insetFromParentBottom(inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Bottom, inset: -inset, priority: priority, identifier: identifier)
    }

    func insetFromParentLeftByAtLeast(inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Left, inset: inset, relatedBy: .GreaterThanOrEqual, priority: priority, identifier: identifier)
    }

    func insetFromParentRightByAtLeast(inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Right, inset: -inset, relatedBy: .LessThanOrEqual, priority: priority, identifier: identifier)
    }

    func insetFromParentTopByAtLeast(inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Top, inset: inset, relatedBy: .GreaterThanOrEqual, priority: priority, identifier: identifier)
    }

    public func insetFromParentBottomByAtLeast(inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.Bottom, inset: -inset, relatedBy: .LessThanOrEqual, priority: priority, identifier: identifier)
    }
    
    private func pinToEdge(edge: NSLayoutAttribute, inset: CGFloat = 0, relatedBy: NSLayoutRelation = .Equal, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        translatesAutoresizingMaskIntoConstraints = false
        let pin = NSLayoutConstraint(item: self,
            attribute: edge,
            relatedBy: relatedBy,
            toItem: superview,
            attribute: edge,
            multiplier: 1,
            constant: inset)
        if let priority = priority {
            pin.priority = priority
        }
        pin.active = true
        pin.identifier = identifier
        return pin
    }
    
    public func alignVerticallyWith(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.CenterY, withSibling: sibling, identifier: identifier)
    }
    
    public func alignHorizontallyWith(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.CenterX, withSibling: sibling, identifier: identifier)
    }

    public func matchWidthOf(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.Width, withSibling: sibling, identifier: identifier)
    }

    public func matchHeightOf(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.Height, withSibling: sibling, identifier: identifier)
    }

    public func matchTopOf(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.Top, withSibling: sibling, identifier: identifier)
    }

    public func matchBottomOf(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.Bottom, withSibling: sibling, identifier: identifier)
    }

    public func matchLeftOf(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.Left, withSibling: sibling, identifier: identifier)
    }

    public func matchRightOf(sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.Right, withSibling: sibling, identifier: identifier)
    }
    
    private func alignDimension(dimension: NSLayoutAttribute, withSibling sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let align = NSLayoutConstraint(item: self,
            attribute: dimension,
            relatedBy: .Equal,
            toItem: sibling,
            attribute: dimension,
            multiplier: 1,
            constant: 0)
        align.active = true
        align.identifier = identifier
        return align
    }
    
    // TODO: this only works if the superview is centered in its superview.
    // Can't use superview.Width as you can't base child's .CenterX on it
    // http://stackoverflow.com/questions/13867736/why-is-nslayoutattributecenterx-an-invalid-pairing-with-nslayoutattributewidth
    public func distributeHorizontally(children: [UIView], identifier: String? = nil) {
        if children.isEmpty {
            return
        }
        
        let superview = children[0].superview!
        for child in children {
            if child.superview != superview {
                return
            }
        }
        
        for (index, child) in children.enumerate() {
            child.translatesAutoresizingMaskIntoConstraints = false
            let multiplier = CGFloat((Float(index) + 0.5) * 2 / Float(children.count))
            let align = NSLayoutConstraint(item: child,
                attribute: .CenterX,
                relatedBy: .Equal,
                toItem: self,
                attribute: .CenterX,
                multiplier: multiplier,
                constant: 0)
            align.identifier = identifier
            align.active = true
        }
    }
    
    // MARK: - sizing

    public func setWidthConstraint(size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .Width, priority: priority, identifier: identifier)
    }
    
    public func setHeightConstraint(size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .Height, priority: priority, identifier: identifier)
    }

    public func setMinWidthConstraint(size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .Width, relatedBy: .GreaterThanOrEqual, priority: priority, identifier: identifier)
    }

    public func setMinHeightConstraint(size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .Height, relatedBy: .GreaterThanOrEqual, priority: priority, identifier: identifier)
    }
    
    private func setSizeConstraint(size: CGFloat, dimension: NSLayoutAttribute, relatedBy: NSLayoutRelation = .Equal, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let sizeConstraint = NSLayoutConstraint(item: self,
            attribute: dimension,
            relatedBy: relatedBy,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: size)
        if let priority = priority {
            sizeConstraint.priority = priority
        }
        sizeConstraint.active = true
        sizeConstraint.identifier = identifier
        return sizeConstraint
    }

    public func matchHeightOfTallest(views: UIView...) -> [NSLayoutConstraint] {
        return matchHeightOfTallest(views)
    }

    public func matchHeightOfTallest(views: [UIView], withBottomMargin bottomMargin: CGFloat = 0, priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            let constraint = NSLayoutConstraint(item: self,
                attribute: .Bottom,
                relatedBy: .GreaterThanOrEqual,
                toItem: view,
                attribute: .Bottom,
                multiplier: 1,
                constant: bottomMargin)
            if let priority = priority {
                constraint.priority = priority
            }
            constraint.identifier = identifier
            constraints.append(constraint)
        }
        NSLayoutConstraint.activateConstraints(constraints)
        return constraints
    }
    
    public func matchParentWidth(identifier identifier: String? = nil) -> NSLayoutConstraint {
        return matchParentDimension(.Width, identifier: identifier)
    }
    
    public func matchParentHeight(identifier identifier: String? = nil) -> NSLayoutConstraint {
        return matchParentDimension(.Height, identifier: identifier)
    }
    
    public func fillParent(identifier identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints += fillParentVertically(identifier: identifier)
        constraints += fillParentHorizontally(identifier: identifier)
        return constraints
    }

    public func fillParentVertically(priority priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToTop(priority: priority, identifier: identifier), pinToBottom(priority: priority, identifier: identifier)]
    }

    public func fillParentHorizontally(priority priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToLeft(priority: priority, identifier: identifier), pinToRight(priority: priority, identifier: identifier)]
    }

    /**
    Add a `NSLayoutConstraint` that sets the height of the view by applying the given ratio to the view's width

    :returns: The constraint that was added to self
    */

    func setAspectRatio(ratio: Float, identifier: String? = nil) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let ratioConstraint = NSLayoutConstraint(item: self,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Width,
            multiplier: CGFloat(1/ratio),
            constant: 0)
        ratioConstraint.active = true
        ratioConstraint.identifier = identifier
        return ratioConstraint
    }

    private func matchParentDimension(dimension: NSLayoutAttribute, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        translatesAutoresizingMaskIntoConstraints = false
        let dimensionConstraint = NSLayoutConstraint(item: self,
            attribute: dimension,
            relatedBy: .Equal,
            toItem: superview,
            attribute: dimension,
            multiplier: 1,
            constant: 0)
        dimensionConstraint.active = true
        dimensionConstraint.identifier = identifier
        return dimensionConstraint
    }
}
