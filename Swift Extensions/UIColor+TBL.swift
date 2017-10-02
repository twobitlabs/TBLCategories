import UIKit

public extension UIColor {

    /**
        Parse a string for a hex color value. Currently does not support 8-character strings with alpha components
     */
    @objc public convenience init?(fromHexString hexString: String) {
        let colorHexString = hexString.replacingOccurrences(of: "#", with: "", options: NSString.CompareOptions(), range: nil)
        let colorScanner = Scanner(string: colorHexString)
        let maxColorValue = UInt32(pow(Float(16), Float(6)))

        var value:UInt32 = 0

        let characters = colorHexString.characters.count
        guard characters == 6 && colorScanner.scanHexInt32(&value) &&  value < maxColorValue else {
            return nil
        }

        let red = (CGFloat)((value & 0xFF0000) >> 16)/255.0
        let green = (CGFloat)((value & 0xFF00) >> 8)/255.0
        let blue = (CGFloat)(value & 0xFF)/255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

    @objc public func toHexString() -> String? {
        guard let components = cgColor.components, components.count >= 3 else { return nil } // ignore alpha

        let red = components[0]
        let green = components[1]
        let blue = components[2]

        let red255 = Int((red * 255).rounded())
        let green255 = Int((green * 255).rounded())
        let blue255 = Int((blue * 255).rounded())

        let redHex = String(format: "%X", red255)
        let greenHex = String(format: "%X", green255)
        let blueHex = String(format: "%X", blue255)

        return "\(redHex)\(greenHex)\(blueHex)"
    }

    @objc public func asImage(width: CGFloat = 1, height: CGFloat = 1) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(cgColor)
        context.fill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
        
}
