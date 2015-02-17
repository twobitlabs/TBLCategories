import UIKit

extension UIView {

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
        roundCorners(.AllCorners)
    }
    
    func roundCorners(corners: UIRectCorner) {
        roundCorners(corners, withRadius:8)
    }
    
    func roundCorners(corners: UIRectCorner, withRadius radius: CGFloat) {
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
    }
    
}