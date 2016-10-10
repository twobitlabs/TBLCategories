import UIKit

public extension NSLayoutConstraint {
    
    public class func constraintsWithVisualFormat(_ format: String, views: Dictionary<String, UIView>, options: NSLayoutFormatOptions = NSLayoutFormatOptions(), metrics: Dictionary<String, NSNumber>? = nil) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: metrics, views:views)
    }

    public class func constraintsWithVisualFormats(_ formats: [String], views: Dictionary<String, UIView>, options: NSLayoutFormatOptions = NSLayoutFormatOptions(), metrics: Dictionary<String, NSNumber>? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for format in formats {
            let theseConstraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: metrics, views: views)
            for constraint in theseConstraints {
                constraints.append(constraint)
            }
        }
        return constraints
    }

}
