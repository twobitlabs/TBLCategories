import UIKit

public extension UIButton {

    class func buttonWithLabel(_ text: String, font: UIFont? = nil, textColor: UIColor? = nil, backgroundColor: UIColor? = nil, padding: CGFloat? = nil) -> UIButton {
        let button = UIButton(type: .custom)

        if #available(iOS 15.0, macCatalyst 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = text
            configuration.baseForegroundColor = textColor

            if let bgColor = backgroundColor {
                configuration.background.image = bgColor.asImage()
            }

            if let buttonFont = font {
                button.titleLabel?.font = buttonFont
            }

            if let paddingValue = padding {
                configuration.contentInsets = NSDirectionalEdgeInsets(top: paddingValue, leading: paddingValue, bottom: paddingValue, trailing: paddingValue)
            }

            button.configuration = configuration
        } else {
            button.setTitle(text, for: .normal)
            button.setTitleColor(textColor, for: .normal)

            if let bgColor = backgroundColor {
                button.setBackgroundImage(bgColor.asImage(), for: .normal)
            }

            if let buttonFont = font {
                button.titleLabel?.font = buttonFont
            }

            if let paddingValue = padding {
                button.contentEdgeInsets = UIEdgeInsets(top: paddingValue, left: paddingValue, bottom: paddingValue, right: paddingValue)
            }
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
