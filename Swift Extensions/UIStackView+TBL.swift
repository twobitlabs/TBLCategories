
import UIKit

extension UIStackView {
    public func removeArrangedSubviews() {
        arrangedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
