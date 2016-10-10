import UIKit

public extension UIButton {

    public class func buttonWithLabel(_ text: String, font: UIFont? = nil, textColor: UIColor? = nil, backgroundColor: UIColor? = nil, padding: CGFloat? = nil) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(text, for: UIControlState())
        button.setTitleColor(textColor, for: UIControlState())
        button.setBackgroundImage(backgroundColor?.asImage(), for: UIControlState()) // asImage() defined in UIColor+TBL
        if font != nil {
            button.titleLabel?.font = font!
        }
        if padding != nil {
            button.contentEdgeInsets = UIEdgeInsets(top: padding!, left: padding!, bottom: padding!, right: padding!)
        }
        return button
    }
    
    public class func buttonWithImage(_ imageName: String, target: AnyObject? = nil, action: Selector? = nil, tintColor: UIColor? = nil, accessibilityLabel: String? = nil) -> UIButton {
        let button = UIButton(type: .custom)
        var image = UIImage(named: imageName)
        if tintColor != nil {
            button.tintColor = tintColor
            image = image?.withRenderingMode(.alwaysTemplate)
        }
        button.setImage(image, for: UIControlState())
        button.frame = CGRect(origin: CGPoint.zero, size: image!.size)
        if target != nil && action != nil {
            button.addTarget(target!, action: action!, for: .touchUpInside)
        }
        if let accessibilityLabel = accessibilityLabel {
            button.accessibilityLabel = accessibilityLabel
        }
        return button
    }
    
}
