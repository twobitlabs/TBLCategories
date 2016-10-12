import UIKit

public extension UIView {

    @discardableResult public func addConstraintsFromDescriptions(_ constraintDescriptions: [String], views: Dictionary<String, UIView>, options: NSLayoutFormatOptions = NSLayoutFormatOptions(), metrics: Dictionary<String, NSNumber>? = nil) -> [NSLayoutConstraint] {
        for view in views.values {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = [NSLayoutConstraint]()
        for constraintDescription in constraintDescriptions {
            constraints += NSLayoutConstraint.constraintsWithVisualFormat(constraintDescription, views: views, options:options, metrics:metrics)
        }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    // MARK: - centering
    
    @discardableResult public func centerChildHorizontally(_ childView: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        childView.translatesAutoresizingMaskIntoConstraints = false
        let centerHorizontally = NSLayoutConstraint(item: childView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        centerHorizontally.identifier = identifier
        centerHorizontally.isActive = true
        return centerHorizontally
    }
    
    @discardableResult public func centerChildrenHorizontally(_ childViews: [UIView], identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in childViews {
            constraints.append(centerChildHorizontally(view, identifier: identifier))
        }
        return constraints
    }
    
    @discardableResult public func centerChildVertically(_ childView: UIView, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        childView.translatesAutoresizingMaskIntoConstraints = false
        let centerVertically = NSLayoutConstraint(item: childView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1,
            constant: 0)
        if let priority = priority {
            centerVertically.priority = priority
        }
        centerVertically.isActive = true
        centerVertically.identifier = identifier
        return centerVertically
    }

    @discardableResult public func centerChildrenVertically(_ childViews: [UIView], identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in childViews {
            constraints.append(centerChildVertically(view, identifier: identifier))
        }
        return constraints
    }

    @discardableResult public func centerChild(_ childView: UIView) -> [NSLayoutConstraint] {
        return [centerChildHorizontally(childView), centerChildVertically(childView)]
    }

    fileprivate func centerSibling(_ sibling: UIView, onDimension dimension: NSLayoutAttribute, identifier: String? = nil)  -> NSLayoutConstraint {
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let centerConstraint = NSLayoutConstraint(item: sibling,
            attribute: dimension,
            relatedBy: .equal,
            toItem: self,
            attribute: dimension,
            multiplier: 1,
            constant: 0)
        centerConstraint.isActive = true
        centerConstraint.identifier = identifier
        return centerConstraint
    }

    @discardableResult public func centerSiblingHorizontally(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint  {
        return centerSibling(sibling, onDimension: .centerX, identifier: identifier)
    }
    
    @discardableResult public func centerSiblingVertically(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint  {
        return centerSibling(sibling, onDimension: .centerY, identifier: identifier)
    }

    @discardableResult public func centerSibling(_ sibling: UIView, identifier: String? = nil) -> [NSLayoutConstraint]  {
        return [centerSiblingHorizontally(sibling, identifier: identifier), centerSiblingVertically(sibling, identifier: identifier)]
    }

    // MARK: - positioning
     
    @discardableResult public func placeAbove(_ sibling: UIView, by offset: CGFloat = 0, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let bottomOffset = NSLayoutConstraint(item: self,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: sibling,
            attribute: .top,
            multiplier: 1,
            constant: -offset)
        bottomOffset.isActive = true
        bottomOffset.identifier = identifier
        return bottomOffset
    }

    /**
     Add a `NSLayoutConstraint` that positions the caller at least `offset` points above `sibling`

     :returns: The constraint that was added to the caller's superview
     */
    @discardableResult public func placeAbove(_ sibling: UIView, byAtLeast offset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let bottomOffset = NSLayoutConstraint(item: self,
                                           attribute: .bottom,
                                           relatedBy: .lessThanOrEqual,
                                           toItem: sibling,
                                           attribute: .top,
                                           multiplier: 1,
                                           constant: -offset)
        bottomOffset.isActive = true
        bottomOffset.identifier = identifier
        return bottomOffset
    }

    @discardableResult public func placeBelow(_ sibling: UIView, by offset: CGFloat = 0, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .top,
            relatedBy: .equal,
            toItem: sibling,
            attribute: .bottom,
            multiplier: 1,
            constant: offset)
        topOffset.isActive = true
        topOffset.identifier = identifier
        return topOffset
    }

    /**
        Add a `NSLayoutConstraint` that positions the caller at least `offset` points below `sibling`
    
        :returns: The constraint that was added to the caller's superview
    */
    @discardableResult public func placeBelow(_ sibling: UIView, byAtLeast offset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let topOffset = NSLayoutConstraint(item: self,
            attribute: .top,
            relatedBy: .greaterThanOrEqual,
            toItem: sibling,
            attribute: .bottom,
            multiplier: 1,
            constant: offset)
        topOffset.isActive = true
        topOffset.identifier = identifier
        return topOffset
    }

    @discardableResult public func placeToRightOf(_ sibling: UIView, by offset: CGFloat = 0, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let rightOffset = NSLayoutConstraint(item: self,
            attribute: .left,
            relatedBy: .equal,
            toItem: sibling,
            attribute: .right,
            multiplier: 1,
            constant: offset)
        rightOffset.isActive = true
        rightOffset.identifier = identifier
        return rightOffset
    }

    /**
        Add a `NSLayoutConstraint` that positions the caller at least `offset` points to the right of `sibling`

        :returns: The constraint that was added to the caller's superview
    */
    @discardableResult public func placeToRightOf(_ sibling: UIView, byAtLeast offset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let rightOffset = NSLayoutConstraint(item: self,
            attribute: .left,
            relatedBy: .greaterThanOrEqual,
            toItem: sibling,
            attribute: .right,
            multiplier: 1,
            constant: offset)
        rightOffset.isActive = true
        rightOffset.identifier = identifier
        return rightOffset
    }

    @discardableResult public func placeToLeftOf(_ sibling: UIView, by offset: CGFloat = 0, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let leftOffset = NSLayoutConstraint(item: self,
            attribute: .right,
            relatedBy: .equal,
            toItem: sibling,
            attribute: .left,
            multiplier: 1,
            constant: -offset)
        leftOffset.isActive = true
        leftOffset.identifier = identifier
        return leftOffset
    }

    /**
    Add a `NSLayoutConstraint` that positions the caller at least `offset` points to the left of `sibling`

    :returns: The constraint that was added to the caller's superview
    */
    @discardableResult public func placeToLeftOf(_ sibling: UIView, byAtLeast offset: CGFloat, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let leftOffset = NSLayoutConstraint(item: self,
            attribute: .right,
            relatedBy: .lessThanOrEqual,
            toItem: sibling,
            attribute: .left,
            multiplier: 1,
            constant: -offset)
        leftOffset.isActive = true
        leftOffset.identifier = identifier
        return leftOffset
    }

    @discardableResult public func pinToTop(priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.top, priority: priority, identifier: identifier)
    }
    
    @discardableResult public func pinToBottom(priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.bottom, priority: priority, identifier: identifier)
    }
    
    @discardableResult public func pinToLeft(priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.left, priority: priority, identifier: identifier)
    }
    
    @discardableResult public func pinToRight(priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.right, priority: priority, identifier: identifier)
    }
    
    @discardableResult public func insetFromParent(_ inset: CGFloat, identifier: String? = nil) -> [NSLayoutConstraint] {
        return insetFromParentVertically(inset, identifier: identifier) + insetFromParentHorizontally(inset, identifier: identifier)
    }

    @discardableResult public func insetFromParentHorizontally(_ inset: CGFloat, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToEdge(.left, inset: inset, identifier: identifier), pinToEdge(.right, inset: -inset, identifier: identifier)]
    }

    @discardableResult public func insetFromParentVertically(_ inset: CGFloat, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToEdge(.top, inset: inset, identifier: identifier), pinToEdge(.bottom, inset: -inset, identifier: identifier)]
    }
    
    @discardableResult public func insetFromParentLeft(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.left, inset: inset, priority: priority, identifier: identifier)
    }
    
    @discardableResult public func insetFromParentRight(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.right, inset: -inset, priority: priority, identifier: identifier)
    }
    
    @discardableResult public func insetFromParentTop(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.top, inset: inset, priority: priority, identifier: identifier)
    }
    
    @discardableResult func insetFromParentBottom(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.bottom, inset: -inset, priority: priority, identifier: identifier)
    }

    @discardableResult func insetFromParentLeftByAtLeast(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.left, inset: inset, relatedBy: .greaterThanOrEqual, priority: priority, identifier: identifier)
    }

    @discardableResult func insetFromParentRightByAtLeast(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.right, inset: -inset, relatedBy: .lessThanOrEqual, priority: priority, identifier: identifier)
    }

    @discardableResult func insetFromParentTopByAtLeast(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.top, inset: inset, relatedBy: .greaterThanOrEqual, priority: priority, identifier: identifier)
    }

    @discardableResult public func insetFromParentBottomByAtLeast(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.bottom, inset: -inset, relatedBy: .lessThanOrEqual, priority: priority, identifier: identifier)
    }
    
    fileprivate func pinToEdge(_ edge: NSLayoutAttribute, inset: CGFloat = 0, relatedBy: NSLayoutRelation = .equal, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
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
        pin.isActive = true
        pin.identifier = identifier
        return pin
    }
    
    @discardableResult public func alignVerticallyWith(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.centerY, withSibling: sibling, identifier: identifier)
    }
    
    @discardableResult public func alignHorizontallyWith(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.centerX, withSibling: sibling, identifier: identifier)
    }

    @discardableResult public func matchWidthOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.width, withSibling: sibling, identifier: identifier)
    }

    @discardableResult public func matchHeightOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.height, withSibling: sibling, identifier: identifier)
    }

    @discardableResult public func matchTopOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.top, withSibling: sibling, identifier: identifier)
    }

    @discardableResult public func matchBottomOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.bottom, withSibling: sibling, identifier: identifier)
    }

    @discardableResult public func matchLeftOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.left, withSibling: sibling, identifier: identifier)
    }

    @discardableResult public func matchRightOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.right, withSibling: sibling, identifier: identifier)
    }
    
    fileprivate func alignDimension(_ dimension: NSLayoutAttribute, withSibling sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        if (superview != sibling.superview!) {
            fatalError("views do not share the same superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        sibling.translatesAutoresizingMaskIntoConstraints = false
        let align = NSLayoutConstraint(item: self,
            attribute: dimension,
            relatedBy: .equal,
            toItem: sibling,
            attribute: dimension,
            multiplier: 1,
            constant: 0)
        align.isActive = true
        align.identifier = identifier
        return align
    }
    
    // TODO: this only works if the superview is centered in its superview.
    // Can't use superview.Width as you can't base child's .CenterX on it
    // http://stackoverflow.com/questions/13867736/why-is-nslayoutattributecenterx-an-invalid-pairing-with-nslayoutattributewidth
    public func distributeHorizontally(_ children: [UIView], identifier: String? = nil) {
        if children.isEmpty {
            return
        }
        
        let superview = children[0].superview!
        for child in children {
            if child.superview != superview {
                return
            }
        }
        
        for (index, child) in children.enumerated() {
            child.translatesAutoresizingMaskIntoConstraints = false
            let multiplier = CGFloat((Float(index) + 0.5) * 2 / Float(children.count))
            let align = NSLayoutConstraint(item: child,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: self,
                attribute: .centerX,
                multiplier: multiplier,
                constant: 0)
            align.identifier = identifier
            align.isActive = true
        }
    }
    
    // MARK: - sizing

    @discardableResult public func setWidthConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .width, priority: priority, identifier: identifier)
    }
    
    @discardableResult public func setHeightConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .height, priority: priority, identifier: identifier)
    }

    @discardableResult public func setMinWidthConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .width, relatedBy: .greaterThanOrEqual, priority: priority, identifier: identifier)
    }

    @discardableResult public func setMinHeightConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .height, relatedBy: .greaterThanOrEqual, priority: priority, identifier: identifier)
    }

    @discardableResult public func setMaxWidthConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .width, relatedBy: .lessThanOrEqual, priority: priority, identifier: identifier)
    }

    @discardableResult public func setMaxHeightConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .height, relatedBy: .lessThanOrEqual, priority: priority, identifier: identifier)
    }

    fileprivate func setSizeConstraint(_ size: CGFloat, dimension: NSLayoutAttribute, relatedBy: NSLayoutRelation = .equal, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let sizeConstraint = NSLayoutConstraint(item: self,
            attribute: dimension,
            relatedBy: relatedBy,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: size)
        if let priority = priority {
            sizeConstraint.priority = priority
        }
        sizeConstraint.isActive = true
        sizeConstraint.identifier = identifier
        return sizeConstraint
    }

    @discardableResult public func matchHeightOfTallest(_ views: UIView...) -> [NSLayoutConstraint] {
        return matchHeightOfTallest(views)
    }

    @discardableResult public func matchHeightOfTallest(_ views: [UIView], withBottomMargin bottomMargin: CGFloat = 0, priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in views {
            let constraint = NSLayoutConstraint(item: self,
                attribute: .bottom,
                relatedBy: .greaterThanOrEqual,
                toItem: view,
                attribute: .bottom,
                multiplier: 1,
                constant: bottomMargin)
            if let priority = priority {
                constraint.priority = priority
            }
            constraint.identifier = identifier
            constraints.append(constraint)
        }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    @discardableResult public func matchParentWidth(identifier: String? = nil) -> NSLayoutConstraint {
        return matchParentDimension(.width, identifier: identifier)
    }
    
    @discardableResult public func matchParentHeight(identifier: String? = nil) -> NSLayoutConstraint {
        return matchParentDimension(.height, identifier: identifier)
    }

    @discardableResult public func pinToParentLayoutMargins(identifier: String? = nil) -> [NSLayoutConstraint] {
        return [match(.top, toParentDimension: .topMargin), match(.bottom, toParentDimension: .bottomMargin), match(.left, toParentDimension: .leftMargin), match(.right, toParentDimension: .rightMargin)]
    }

    @discardableResult public func fillParent(identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints += fillParentVertically(identifier: identifier)
        constraints += fillParentHorizontally(identifier: identifier)
        return constraints
    }

    @discardableResult public func fillParentVertically(priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToTop(priority: priority, identifier: identifier), pinToBottom(priority: priority, identifier: identifier)]
    }

    @discardableResult public func fillParentHorizontally(priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToLeft(priority: priority, identifier: identifier), pinToRight(priority: priority, identifier: identifier)]
    }

    /**
    Add a `NSLayoutConstraint` that sets the height of the view by applying the given ratio to the view's width

    :returns: The constraint that was added to self
    */

    @discardableResult func setAspectRatio(_ ratio: Float, identifier: String? = nil) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let ratioConstraint = NSLayoutConstraint(item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: self,
            attribute: .width,
            multiplier: CGFloat(1/ratio),
            constant: 0)
        ratioConstraint.isActive = true
        ratioConstraint.identifier = identifier
        return ratioConstraint
    }

    @discardableResult public func match(_ dimension: NSLayoutAttribute, toParentDimension parentDimension: NSLayoutAttribute, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        translatesAutoresizingMaskIntoConstraints = false
        let dimensionConstraint = NSLayoutConstraint(item: self,
                                                     attribute: dimension,
                                                     relatedBy: .equal,
                                                     toItem: superview,
                                                     attribute: parentDimension,
                                                     multiplier: 1,
                                                     constant: 0)
        dimensionConstraint.isActive = true
        dimensionConstraint.identifier = identifier
        return dimensionConstraint
    }

    fileprivate func matchParentDimension(_ dimension: NSLayoutAttribute, identifier: String? = nil) -> NSLayoutConstraint {
        let superview = self.superview!
        translatesAutoresizingMaskIntoConstraints = false
        let dimensionConstraint = NSLayoutConstraint(item: self,
            attribute: dimension,
            relatedBy: .equal,
            toItem: superview,
            attribute: dimension,
            multiplier: 1,
            constant: 0)
        dimensionConstraint.isActive = true
        dimensionConstraint.identifier = identifier
        return dimensionConstraint
    }
}
