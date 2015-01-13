//
//  UIColor+TBL.swift
//
//  Created by Christopher Pickslay on 1/12/15.
//

import Foundation

extension UIColor {
    
    class func colorFromHexString(hexString: String) -> UIColor? {
        let colorHexString = hexString.stringByReplacingOccurrencesOfString("#", withString: "", options: NSStringCompareOptions.allZeros, range: nil)
        let colorScanner = NSScanner(string: colorHexString)
        
        var value:UInt32 = 0
        
        let characters = countElements(colorHexString)
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
        
}