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
    
    func centerChildHorizontally(childView: UIView) {
        childView.setTranslatesAutoresizingMaskIntoConstraints(false);
        let centerHorizontally = NSLayoutConstraint(item:childView,
            attribute:.CenterX,
            relatedBy:.Equal,
            toItem:self,
            attribute:.CenterX,
            multiplier:1,
            constant:0);
        addConstraint(centerHorizontally);
    }
    
    func centerChildVertically(childView: UIView) {
        childView.setTranslatesAutoresizingMaskIntoConstraints(false);
        let centerVertically = NSLayoutConstraint(item:childView,
            attribute:.CenterY,
            relatedBy:.Equal,
            toItem:self,
            attribute:.CenterY,
            multiplier:1,
            constant:0);
        addConstraint(centerVertically);
    }

    func centerChild(childView: UIView) {
        centerChildHorizontally(childView)
        centerChildVertically(childView)
    }
    
}