
import UIKit

extension UIDevice {
    var isIpad: Bool {
        return userInterfaceIdiom == .Pad
    }

    var isIphone: Bool {
        return userInterfaceIdiom == .Phone
    }
}