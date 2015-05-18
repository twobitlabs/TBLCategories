import UIKit

public extension NSLayoutConstraint {
    
    public class func constraintsWithVisualFormat(format: String, views: Dictionary<String, UIView>, options: NSLayoutFormatOptions = NSLayoutFormatOptions.allZeros, metrics: Dictionary<String, NSNumber>? = nil) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views:views) as [NSLayoutConstraint]
    }

    public class func constraintsWithVisualFormats(formats: [String], views: Dictionary<String, UIView>, options: NSLayoutFormatOptions = NSLayoutFormatOptions.allZeros, metrics: Dictionary<String, NSNumber>? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for format in formats {
            var theseConstraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: views)
            for constraint in theseConstraints {
                constraints.append(constraint as NSLayoutConstraint)
            }
        }
        return constraints
    }

}