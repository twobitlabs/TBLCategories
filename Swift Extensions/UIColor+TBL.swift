import UIKit

public extension UIColor {

    /**
        Parse a string for a hex color value. Currently does not support 8-character strings with alpha components
     */
    public convenience init?(fromHexString hexString: String) {
        let colorHexString = hexString.stringByReplacingOccurrencesOfString("#", withString: "", options: NSStringCompareOptions(), range: nil)
        let colorScanner = NSScanner(string: colorHexString)
        let maxColorValue = UInt32(pow(Float(16), Float(6)))

        var value:UInt32 = 0

        let characters = colorHexString.characters.count
        guard characters == 6 && colorScanner.scanHexInt(&value) &&  value < maxColorValue else {
            return nil
        }

        let red = (CGFloat)((value & 0xFF0000) >> 16)/255.0
        let green = (CGFloat)((value & 0xFF00) >> 8)/255.0
        let blue = (CGFloat)(value & 0xFF)/255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

    public func asImage() -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
        
}
