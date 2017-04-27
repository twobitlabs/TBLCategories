
import Foundation
import UIKit

public extension UIScrollView {
    
    public func scrollToTop() {
        self.setContentOffset(CGPoint(x: 0, y: -self.contentInset.top), animated: true)
    }
}
