import UIKit

extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)

        let context = UIGraphicsGetCurrentContext() as CGContextRef
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, kCGBlendModeNormal)

        let rect = CGRectMake(0, 0, self.size.width, self.size.height) as CGRect
        CGContextClipToMask(context, rect, self.CGImage)
        color.setFill()
        CGContextFillRect(context, rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()

        return newImage
    }

    class func imageWithText(text: String, textAttributes: [NSObject: AnyObject]) -> UIImage {
        let size = text.sizeWithAttributes(textAttributes)

        UIGraphicsBeginImageContext(size)
        text.drawInRect(CGRect(origin: CGPointZero, size: size), withAttributes: textAttributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    class func imageWithText(text: String, font: UIFont, color: UIColor? = UIColor.darkTextColor()) -> UIImage {
        var attributes = [NSObject : AnyObject]()
        attributes[NSFontAttributeName] = font
        attributes[NSForegroundColorAttributeName] = color

        return imageWithText(text, textAttributes: attributes)
    }

    class func imageWithText(text: String, fontSize: CGFloat, color: UIColor? = nil) -> UIImage {
        return imageWithText(text, font: UIFont.systemFontOfSize(fontSize), color: color)
    }
}