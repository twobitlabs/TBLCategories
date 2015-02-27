import UIKit

extension UIButton {

    class func buttonWithLabel(text: String, font: UIFont? = nil, textColor: UIColor? = nil, backgroundColor: UIColor? = nil) -> UIButton {
        let button = UIButton.buttonWithType(.Custom) as UIButton
        button.setTitle(text, forState: .Normal)
        button.setTitleColor(textColor, forState: .Normal)
        button.setBackgroundImage(backgroundColor?.asImage(), forState: .Normal)
        if font != nil {
            button.titleLabel?.font = font!
        }
        return button
    }
    
    class func buttonWithImage(imageName: String, tintColor: UIColor? = nil) -> UIButton {
        var image = UIImage(named: imageName)
        let button = UIButton.buttonWithType(.Custom) as UIButton
        if tintColor != nil {
            button.tintColor = tintColor
            image = image?.imageWithRenderingMode(.AlwaysTemplate)
        }
        button.setImage(image, forState: .Normal)
        button.frame = CGRect(origin: CGPointZero, size: image!.size)
        return button
    }
    
    class func buttonWithImage(imageName: String, target: AnyObject, action: Selector) -> UIButton {
        let button = UIButton.buttonWithImage(imageName)
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        return button
    }
    
}