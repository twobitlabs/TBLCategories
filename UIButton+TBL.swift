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
    
    class func buttonWithImage(imageName: String, target: AnyObject? = nil, action: Selector? = nil, tintColor: UIColor? = nil) -> UIButton {
        let button = UIButton.buttonWithType(.Custom) as UIButton
        var image = UIImage(named: imageName)
        if tintColor != nil {
            button.tintColor = tintColor
            image = image?.imageWithRenderingMode(.AlwaysTemplate)
        }
        button.setImage(image, forState: .Normal)
        button.frame = CGRect(origin: CGPointZero, size: image!.size)
        if target != nil && action != nil {
            button.addTarget(target!, action: action!, forControlEvents: .TouchUpInside)
        }, tintColor: UIColor.rexIconColor()
        return button
    }
    
}