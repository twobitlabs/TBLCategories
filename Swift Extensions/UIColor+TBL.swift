import UIKit

public extension UIColor {

    /**
        Parse a string for a hex color value. Currently does not support 8-character strings with alpha components
     */
    @objc convenience init?(fromHexString hexString: String) {
        let colorHexString = hexString.replacingOccurrences(of: "#", with: "", options: NSString.CompareOptions(), range: nil)
        let scanner = Scanner(string: colorHexString)
        var hexValue: UInt64 = 0
        switch colorHexString.count {
            case 8:
                if scanner.scanHexInt64(&hexValue) {
                    let r = CGFloat((hexValue & 0xff000000) >> 24) / 255
                    let g = CGFloat((hexValue & 0x00ff0000) >> 16) / 255
                    let b = CGFloat((hexValue & 0x0000ff00) >> 8) / 255
                    let a = CGFloat(hexValue & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            case 6:
                if scanner.scanHexInt64(&hexValue) {
                    let r = CGFloat((hexValue & 0x00ff0000) >> 16) / 255
                    let g = CGFloat((hexValue & 0x0000ff00) >> 8) / 255
                    let b = CGFloat(hexValue & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            default:
                return nil
        }
        return nil
    }

    @objc func toHexString() -> String? {
        guard let components = cgColor.components, components.count >= 3 else { return nil } // ignore alpha

        let red = components[0]
        let green = components[1]
        let blue = components[2]

        let red255 = Int((red * 255).rounded())
        let green255 = Int((green * 255).rounded())
        let blue255 = Int((blue * 255).rounded())

        let redHex = String(format: "%02X", red255)
        let greenHex = String(format: "%02X", green255)
        let blueHex = String(format: "%02X", blue255)

        return "\(redHex)\(greenHex)\(blueHex)"
    }

    @objc func asImage(width: CGFloat = 1, height: CGFloat = 1) -> UIImage {
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
