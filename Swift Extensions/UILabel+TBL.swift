import UIKit

public extension UILabel {
    
    convenience init(text: String?) {
        self.init(frame: CGRect.zero)
        self.text = text
    }
    
    convenience init(font: UIFont, textColor: UIColor? = nil, text: String? = nil, alignment: NSTextAlignment = .left) {
        self.init(text: nil)
        self.font = font
        self.text = text
        self.textAlignment = alignment
        if textColor != nil {
            self.textColor = textColor!
        }
    }
    
}
