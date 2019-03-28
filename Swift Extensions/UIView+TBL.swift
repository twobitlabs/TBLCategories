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
    
    func roundCorners() {
        roundCorners(.allCorners)
    }
    
    func roundCorners(_ corners: UIRectCorner) {
        roundCorners(corners, withRadius:8)
    }
    
    func roundCorners(_ corners: UIRectCorner, withRadius radius: CGFloat) {
        if (corners == .allCorners) {
            self.layer.cornerRadius = radius;
        } else {
            let roundedPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.backgroundColor = UIColor.clear.cgColor
            maskLayer.fillColor = UIColor.white.cgColor
            maskLayer.path = roundedPath.cgPath
            self.layer.mask = maskLayer
        }
        clipsToBounds = true
    }
    
}
