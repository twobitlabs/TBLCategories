
import UIKit

extension UIStackView {
    public func removeArrangedSubviews() {
        arrangedSubviews.forEach({ $0.removeFromSuperview() })
        // UIStackView retains removed subviews until layoutIfNeeded is called (iOS 14)
        layoutIfNeeded()
    }
}
