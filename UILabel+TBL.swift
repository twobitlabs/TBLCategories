
extension UILabel {
    
    convenience init(text: String?) {
        self.init(frame: CGRectZero)
        self.text = text
    }
    
    convenience init(font: UIFont, textColor: UIColor? = nil) {
        self.init(text: nil)
        self.font = font
        if textColor != nil {
            self.textColor = textColor!
        }
    }
    
}