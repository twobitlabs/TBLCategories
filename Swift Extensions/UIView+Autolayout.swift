import UIKit

public extension UIView {

    @discardableResult func addConstraintsFromDescriptions(_ constraintDescriptions: [String], views: Dictionary<String, UIView>, options: NSLayoutConstraint.FormatOptions = NSLayoutConstraint.FormatOptions(), metrics: Dictionary<String, NSNumber>? = nil) -> [NSLayoutConstraint] {
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
    
    @discardableResult func centerChildHorizontally(_ childView: UIView, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        childView.translatesAutoresizingMaskIntoConstraints = false
        let centerHorizontally = NSLayoutConstraint(item: childView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0)
        if let priority = priority {
            centerHorizontally.priority = priority
        }
        centerHorizontally.identifier = identifier
        centerHorizontally.isActive = true
        return centerHorizontally
    }
    
    @discardableResult func centerChildrenHorizontally(_ childViews: [UIView], identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in childViews {
            constraints.append(centerChildHorizontally(view, identifier: identifier))
        }
        return constraints
    }
    
    @discardableResult func centerChildVertically(_ childView: UIView, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
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

    @discardableResult func centerChildrenVertically(_ childViews: [UIView], identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for view in childViews {
            constraints.append(centerChildVertically(view, identifier: identifier))
        }
        return constraints
    }

    @objc @discardableResult func centerChild(_ childView: UIView) -> [NSLayoutConstraint] {
        return [centerChildHorizontally(childView), centerChildVertically(childView)]
    }

    fileprivate func centerSibling(_ sibling: UIView, onDimension dimension: NSLayoutConstraint.Attribute, identifier: String? = nil)  -> NSLayoutConstraint {
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

    @discardableResult func centerSiblingHorizontally(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint  {
        return centerSibling(sibling, onDimension: .centerX, identifier: identifier)
    }
    
    @discardableResult func centerSiblingVertically(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint  {
        return centerSibling(sibling, onDimension: .centerY, identifier: identifier)
    }

    @discardableResult func centerSibling(_ sibling: UIView, identifier: String? = nil) -> [NSLayoutConstraint]  {
        return [centerSiblingHorizontally(sibling, identifier: identifier), centerSiblingVertically(sibling, identifier: identifier)]
    }

    // MARK: - positioning
     
    @discardableResult func placeAbove(_ sibling: UIView, by offset: CGFloat = 0, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        guard superview != nil, sibling.superview != nil else {
            assertionFailure("both views must have a superview")
            return NSLayoutConstraint()
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
        if let priority = priority {
            bottomOffset.priority = priority
        }
        bottomOffset.isActive = true
        bottomOffset.identifier = identifier
        return bottomOffset
    }

    /**
     Add a `NSLayoutConstraint` that positions the caller at least `offset` points above `sibling`

     :returns: The constraint that was added to the caller's superview
     */
    @discardableResult func placeAbove(_ sibling: UIView, byAtLeast offset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        guard superview != nil, sibling.superview != nil else {
            assertionFailure("both views must have a superview")
            return NSLayoutConstraint()
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
        if let priority = priority {
            bottomOffset.priority = priority
        }
        bottomOffset.isActive = true
        bottomOffset.identifier = identifier
        return bottomOffset
    }

    @discardableResult func placeBelow(_ sibling: UIView, by offset: CGFloat = 0, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        guard superview != nil, sibling.superview != nil else {
            assertionFailure("both views must have a superview")
            return NSLayoutConstraint()
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
        if let priority = priority {
            topOffset.priority = priority
        }
        topOffset.isActive = true
        topOffset.identifier = identifier
        return topOffset
    }

    /**
        Add a `NSLayoutConstraint` that positions the caller at least `offset` points below `sibling`
    
        :returns: The constraint that was added to the caller's superview
    */
    @discardableResult func placeBelow(_ sibling: UIView, byAtLeast offset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        guard superview != nil, sibling.superview != nil else {
            assertionFailure("both views must have a superview")
            return NSLayoutConstraint()
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
        if let priority = priority {
            topOffset.priority = priority
        }
        topOffset.isActive = true
        topOffset.identifier = identifier
        return topOffset
    }

    @discardableResult func placeToRightOf(_ sibling: UIView, by offset: CGFloat = 0, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        guard superview != nil, sibling.superview != nil else {
            assertionFailure("both views must have a superview")
            return NSLayoutConstraint()
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
        if let priority = priority {
            rightOffset.priority = priority
        }
        rightOffset.isActive = true
        rightOffset.identifier = identifier
        return rightOffset
    }

    /**
        Add a `NSLayoutConstraint` that positions the caller at least `offset` points to the right of `sibling`

        :returns: The constraint that was added to the caller's superview
    */
    @discardableResult func placeToRightOf(_ sibling: UIView, byAtLeast offset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        guard superview != nil, sibling.superview != nil else {
            assertionFailure("both views must have a superview")
            return NSLayoutConstraint()
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
        if let priority = priority {
            rightOffset.priority = priority
        }
        rightOffset.isActive = true
        rightOffset.identifier = identifier
        return rightOffset
    }

    @discardableResult func placeToLeftOf(_ sibling: UIView, by offset: CGFloat = 0, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        guard superview != nil, sibling.superview != nil else {
            assertionFailure("both views must have a superview")
            return NSLayoutConstraint()
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
        if let priority = priority {
            leftOffset.priority = priority
        }
        leftOffset.isActive = true
        leftOffset.identifier = identifier
        return leftOffset
    }

    /**
    Add a `NSLayoutConstraint` that positions the caller at least `offset` points to the left of `sibling`

    :returns: The constraint that was added to the caller's superview
    */
    @discardableResult func placeToLeftOf(_ sibling: UIView, byAtLeast offset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        guard superview != nil, sibling.superview != nil else {
            assertionFailure("both views must have a superview")
            return NSLayoutConstraint()
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
        if let priority = priority {
            leftOffset.priority = priority
        }
        leftOffset.isActive = true
        leftOffset.identifier = identifier
        return leftOffset
    }

    @discardableResult func pinToTop(priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.top, priority: priority, identifier: identifier)
    }
    
    @discardableResult func pinToBottom(priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.bottom, priority: priority, identifier: identifier)
    }
    
    @discardableResult func pinToLeft(priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.left, priority: priority, identifier: identifier)
    }
    
    @discardableResult func pinToRight(priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.right, priority: priority, identifier: identifier)
    }
    
    @discardableResult func insetFromParent(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return insetFromParentVertically(inset, priority: priority, identifier: identifier) + insetFromParentHorizontally(inset, priority: priority, identifier: identifier)
    }

    @discardableResult func insetFromParentHorizontally(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToEdge(.left, inset: inset, priority: priority, identifier: identifier), pinToEdge(.right, inset: -inset, priority: priority, identifier: identifier)]
    }

    @discardableResult func insetFromParentHorizontally(byAtLeast inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToEdge(.left, inset: inset, relatedBy: .greaterThanOrEqual, priority: priority, identifier: identifier), pinToEdge(.right, inset: -inset, relatedBy: .lessThanOrEqual, priority: priority, identifier: identifier)]
    }

    @discardableResult func insetFromParentVertically(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToEdge(.top, inset: inset, priority: priority, identifier: identifier), pinToEdge(.bottom, inset: -inset, priority: priority, identifier: identifier)]
    }

    @discardableResult func insetFromParentVertically(byAtLeast inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToEdge(.top, inset: inset, relatedBy: .greaterThanOrEqual, priority: priority, identifier: identifier), pinToEdge(.bottom, inset: -inset, relatedBy: .lessThanOrEqual, priority: priority, identifier: identifier)]
    }
    
    @discardableResult func insetFromParentLeft(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.left, inset: inset, priority: priority, identifier: identifier)
    }
    
    @discardableResult func insetFromParentRight(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.right, inset: -inset, priority: priority, identifier: identifier)
    }
    
    @discardableResult func insetFromParentTop(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil, safeArea: Bool = false) -> NSLayoutConstraint {
        guard let superview = superview else {
            assertionFailure("view must have a superview")
            return NSLayoutConstraint()
        }
        translatesAutoresizingMaskIntoConstraints = false
        let constraint: NSLayoutConstraint
        if #available(iOS 11.0, *), safeArea {
            constraint = topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: inset)
        } else {
            constraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: inset)
        }
        if let priority = priority { constraint.priority = priority }
        constraint.identifier = identifier
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func insetFromParentBottom(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil, safeArea: Bool = false) -> NSLayoutConstraint {
        guard let superview = superview else {
            assertionFailure("view must have a superview")
            return NSLayoutConstraint()
        }
        translatesAutoresizingMaskIntoConstraints = false
        let constraint: NSLayoutConstraint
        if #available(iOS 11.0, *), safeArea {
            constraint = bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -inset)
        } else {
            constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset)
        }
        if let priority = priority { constraint.priority = priority }
        constraint.identifier = identifier
        constraint.isActive = true
        return constraint
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

    @discardableResult func insetFromParentBottomByAtLeast(_ inset: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return pinToEdge(.bottom, inset: -inset, relatedBy: .lessThanOrEqual, priority: priority, identifier: identifier)
    }
    
    fileprivate func pinToEdge(_ edge: NSLayoutConstraint.Attribute, inset: CGFloat = 0, relatedBy: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        guard let superview = superview else {
            assertionFailure("view must have a superview")
            return NSLayoutConstraint()
        }
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
    
    @discardableResult func alignVerticallyWith(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.centerY, withSibling: sibling, identifier: identifier)
    }
    
    @discardableResult func alignHorizontallyWith(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.centerX, withSibling: sibling, identifier: identifier)
    }

    @discardableResult func matchWidthOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.width, withSibling: sibling, identifier: identifier)
    }

    @discardableResult func matchHeightOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.height, withSibling: sibling, identifier: identifier)
    }

    @discardableResult func matchTopOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.top, withSibling: sibling, identifier: identifier)
    }

    @discardableResult func matchBottomOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.bottom, withSibling: sibling, identifier: identifier)
    }

    @discardableResult func matchLeftOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.left, withSibling: sibling, identifier: identifier)
    }

    @discardableResult func matchRightOf(_ sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.right, withSibling: sibling, identifier: identifier)
    }

    @discardableResult func matchFirstBaseline(of sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
        return alignDimension(.firstBaseline, withSibling: sibling, identifier: identifier)
    }

    fileprivate func alignDimension(_ dimension: NSLayoutConstraint.Attribute, withSibling sibling: UIView, identifier: String? = nil) -> NSLayoutConstraint {
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
    func distributeHorizontally(_ children: [UIView], identifier: String? = nil) {
        guard !children.isEmpty, let superview = children[0].superview else { return }

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

    @discardableResult func setWidthConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .width, priority: priority, identifier: identifier)
    }
    
    @discardableResult func setHeightConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .height, priority: priority, identifier: identifier)
    }

    @discardableResult func setMinWidthConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .width, relatedBy: .greaterThanOrEqual, priority: priority, identifier: identifier)
    }

    @discardableResult func setMinHeightConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .height, relatedBy: .greaterThanOrEqual, priority: priority, identifier: identifier)
    }

    @discardableResult func setMaxWidthConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .width, relatedBy: .lessThanOrEqual, priority: priority, identifier: identifier)
    }

    @discardableResult func setMaxHeightConstraint(_ size: CGFloat, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        return setSizeConstraint(size, dimension: .height, relatedBy: .lessThanOrEqual, priority: priority, identifier: identifier)
    }

    fileprivate func setSizeConstraint(_ size: CGFloat, dimension: NSLayoutConstraint.Attribute, relatedBy: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
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

    @discardableResult func matchHeightOfTallest(_ views: UIView...) -> [NSLayoutConstraint] {
        return matchHeightOfTallest(views)
    }

    @discardableResult func matchHeightOfTallest(_ views: [UIView], withBottomMargin bottomMargin: CGFloat = 0, priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
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

    @discardableResult func matchParentWidth(identifier: String? = nil) -> NSLayoutConstraint {
        return matchParentDimension(.width, identifier: identifier)
    }
    
    @discardableResult func matchParentHeight(identifier: String? = nil) -> NSLayoutConstraint {
        return matchParentDimension(.height, identifier: identifier)
    }

    @discardableResult func pinToParentLayoutMargins(identifier: String? = nil) -> [NSLayoutConstraint] {
        return [match(.top, toParentDimension: .topMargin), match(.bottom, toParentDimension: .bottomMargin), match(.left, toParentDimension: .leftMargin), match(.right, toParentDimension: .rightMargin)]
    }

    @objc @discardableResult func fillParent(identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints += fillParentVertically(identifier: identifier)
        constraints += fillParentHorizontally(identifier: identifier)
        return constraints
    }

    @discardableResult func fillParentVertically(priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToTop(priority: priority, identifier: identifier), pinToBottom(priority: priority, identifier: identifier)]
    }

    @discardableResult func fillParentHorizontally(priority: UILayoutPriority? = nil, identifier: String? = nil) -> [NSLayoutConstraint] {
        return [pinToLeft(priority: priority, identifier: identifier), pinToRight(priority: priority, identifier: identifier)]
    }

    @discardableResult func fillParentHorizontallyUpTo(width: CGFloat, withInsets insets: CGFloat = 0, identifier: String? = nil) -> [NSLayoutConstraint] {
        var constraints = insetFromParentHorizontally(insets, priority: UILayoutPriority(rawValue: 999), identifier: identifier)
        constraints.append(setMaxWidthConstraint(width - (2 * insets), identifier: identifier))
        return constraints
    }

    /**
    Add a `NSLayoutConstraint` that sets the height of the view by applying the given ratio to the view's width

    :returns: The constraint that was added to self
    */

    @discardableResult func setAspectRatio(_ ratio: Float, priority: UILayoutPriority? = nil, identifier: String? = nil) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let ratioConstraint = NSLayoutConstraint(item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: self,
            attribute: .width,
            multiplier: CGFloat(1/ratio),
            constant: 0)
        if let priority = priority {
            ratioConstraint.priority = priority
        }
        ratioConstraint.isActive = true
        ratioConstraint.identifier = identifier
        return ratioConstraint
    }

    @discardableResult func match(_ dimension: NSLayoutConstraint.Attribute, toParentDimension parentDimension: NSLayoutConstraint.Attribute, identifier: String? = nil) -> NSLayoutConstraint {
        guard let superview = superview else {
            assertionFailure("view must have a superview")
            return NSLayoutConstraint()
        }
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

    fileprivate func matchParentDimension(_ dimension: NSLayoutConstraint.Attribute, identifier: String? = nil) -> NSLayoutConstraint {
        guard let superview = superview else {
            assertionFailure("view must have a superview")
            return NSLayoutConstraint()
        }
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
