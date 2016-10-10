import UIKit

extension UIImage {
    func imageWithColor(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)

        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(.normal)

        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()

        return newImage
    }

    class func imageWithText(_ text: String, textAttributes: [String: AnyObject]) -> UIImage {
        let size = text.size(attributes: textAttributes)

        UIGraphicsBeginImageContext(size)
        text.draw(in: CGRect(origin: CGPoint.zero, size: size), withAttributes: textAttributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!
    }

    class func imageWithText(_ text: String, font: UIFont, color: UIColor? = UIColor.darkText) -> UIImage {
        var attributes = [String : AnyObject]()
        attributes[NSFontAttributeName] = font
        attributes[NSForegroundColorAttributeName] = color

        return imageWithText(text, textAttributes: attributes)
    }

    class func imageWithText(_ text: String, fontSize: CGFloat, color: UIColor? = nil) -> UIImage {
        return imageWithText(text, font: UIFont.systemFont(ofSize: fontSize), color: color)
    }
}
