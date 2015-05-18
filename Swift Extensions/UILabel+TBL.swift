import UIKit

public extension UILabel {
    
    public convenience init(text: String?) {
        self.init(frame: CGRectZero)
        self.text = text
    }
    
    public convenience init(font: UIFont, textColor: UIColor? = nil, text: String? = nil, alignment: NSTextAlignment = .Left) {
        self.init(text: nil)
        self.font = font
        self.text = text
        self.textAlignment = alignment
        if textColor != nil {
            self.textColor = textColor!
        }
    }
    
}