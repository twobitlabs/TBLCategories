import UIKit

public extension UIView {

    public var visible: Bool {
        get {
            return !hidden
        }

        set {
            hidden = !newValue
        }
    }

    public func top() -> CGFloat {
        return frame.origin.y
    }
    
    public func bottom() -> CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public func left() -> CGFloat {
        return frame.origin.x
    }
    
    public func right() -> CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    public func height() -> CGFloat {
        return frame.size.height
    }
    
    public func width() -> CGFloat {
        return frame.size.width
    }
    
    public func roundCorners() {
        roundCorners(.AllCorners)
    }
    
    public func roundCorners(corners: UIRectCorner) {
        roundCorners(corners, withRadius:8)
    }
    
    public func roundCorners(corners: UIRectCorner, withRadius radius: CGFloat) {
        if (corners == .AllCorners) {
            self.layer.cornerRadius = radius;
        } else {
            let roundedPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.backgroundColor = UIColor.clearColor().CGColor
            maskLayer.fillColor = UIColor.whiteColor().CGColor
            maskLayer.path = roundedPath.CGPath
            self.layer.mask = maskLayer
        }
        clipsToBounds = true
    }
    
}