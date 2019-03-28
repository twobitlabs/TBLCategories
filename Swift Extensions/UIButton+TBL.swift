import UIKit

public extension UIButton {

    class func buttonWithLabel(_ text: String, font: UIFont? = nil, textColor: UIColor? = nil, backgroundColor: UIColor? = nil, padding: CGFloat? = nil) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(text, for: UIControl.State())
        button.setTitleColor(textColor, for: UIControl.State())
        button.setBackgroundImage(backgroundColor?.asImage(), for: UIControl.State()) // asImage() defined in UIColor+TBL
        if font != nil {
            button.titleLabel?.font = font!
        }
        if padding != nil {
            button.contentEdgeInsets = UIEdgeInsets(top: padding!, left: padding!, bottom: padding!, right: padding!)
        }
        return button
    }
    
    class func buttonWithImage(_ imageName: String, target: AnyObject? = nil, action: Selector? = nil, tintColor: UIColor? = nil, accessibilityLabel: String? = nil) -> UIButton {
        let button = UIButton(type: .custom)
        var image = UIImage(named: imageName)
        if tintColor != nil {
            button.tintColor = tintColor
            image = image?.withRenderingMode(.alwaysTemplate)
        }
        button.setImage(image, for: UIControl.State())
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
