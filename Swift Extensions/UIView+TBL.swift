import UIKit

@objc public extension UIView {

    var visible: Bool {
        get {
            return !isHidden
        }

        set {
            isHidden = !newValue
        }
    }

    func top() -> CGFloat {
        return frame.origin.y
    }
    
    func bottom() -> CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    func left() -> CGFloat {
        return frame.origin.x
    }
    
    func right() -> CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    func height() -> CGFloat {
        return frame.size.height
    }
    
    func width() -> CGFloat {
        return frame.size.width
    }
    
    @available(iOS 11.0, *)
    func roundCorners(_ corners: UIRectCorner = .allCorners, withRadius radius: CGFloat = 8) {
        self.layer.cornerRadius = radius
        if !corners.isEmpty {
            self.layer.maskedCorners = corners.maskedCorners
        }
        clipsToBounds = true
    }
}

extension UIRectCorner {
    var maskedCorners: CACornerMask {
        var maskedCorners = [CACornerMask]()
        if contains(.topLeft) || contains(.allCorners) {
            maskedCorners.append(.layerMinXMinYCorner)
        }
        if contains(.topRight) || contains(.allCorners) {
            maskedCorners.append(.layerMaxXMinYCorner)
        }
        if contains(.bottomLeft) || contains(.allCorners) {
            maskedCorners.append(.layerMinXMaxYCorner)
        }
        if contains(.bottomRight) || contains(.allCorners) {
            maskedCorners.append(.layerMaxXMaxYCorner)
        }
        return CACornerMask(maskedCorners)
    }
}
