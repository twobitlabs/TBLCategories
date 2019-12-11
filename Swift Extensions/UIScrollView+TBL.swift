
import Foundation
import UIKit

public extension UIScrollView {

    // This is an @objc declaration so that it can be overridden in subclasses.
    @objc func scrollToTop(animated: Bool = true) {
        let y: CGFloat = {
            if #available(iOS 11.0, *) {
                return -self.adjustedContentInset.top
            }
            return -self.contentInset.top
        }()
        self.setContentOffset(CGPoint(x: 0, y: y), animated: animated)
    }
}
