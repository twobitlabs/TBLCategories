//
//  UIButton+TBL.swift
//
//  Created by Christopher Pickslay on 1/28/15.
//

extension UIButton {
    
    class func buttonWithImage(imageName: String) -> UIButton {
        let image = UIImage(named: imageName)
        let button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
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