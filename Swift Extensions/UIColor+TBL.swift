import UIKit

public extension UIColor {
    
    public class func colorFromHexString(hexString: String) -> UIColor? {
        let colorHexString = hexString.stringByReplacingOccurrencesOfString("#", withString: "", options: NSStringCompareOptions(), range: nil)
        let colorScanner = NSScanner(string: colorHexString)
        
        var value:UInt32 = 0

        let characters = colorHexString.characters.count
        if (characters == 6) {
            // no alpha supported
            if (colorScanner.scanHexInt(&value)) {
                let maxColorValue = UInt32(pow(Float(16), Float(6)))
                if (value < maxColorValue) {
                    let red = (CGFloat)((value & 0xFF0000) >> 16)/255.0
                    let green = (CGFloat)((value & 0xFF00) >> 8)/255.0
                    let blue = (CGFloat)(value & 0xFF)/255.0
                    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
                }
            }
        }
        
        return nil
    }

    public func asImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, CGColor)
        CGContextFillRect(context, rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
        
}