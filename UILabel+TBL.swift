import UIKit

extension UILabel {
    
    convenience init(text: String?) {
        self.init(frame: CGRectZero)
        self.text = text
    }
    
    convenience init(font: UIFont, textColor: UIColor? = nil, text: String? = nil, alignment: NSTextAlignment = .Left) {
        self.init(text: nil)
        self.font = font
        self.text = text
        self.textAlignment = alignment
        if textColor != nil {
            self.textColor = textColor!
        }
    }
    
}