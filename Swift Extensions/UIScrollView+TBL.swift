
import Foundation
import UIKit

public extension UIScrollView {
    
    func scrollToTop(animated: Bool = true) {
        let y: CGFloat = {
            if #available(iOS 11.0, *) {
                return -self.adjustedContentInset.top
            }
            return -self.contentInset.top
        }()
        self.setContentOffset(CGPoint(x: 0, y: y), animated: animated)
    }
}
