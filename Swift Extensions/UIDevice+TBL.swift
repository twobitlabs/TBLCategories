
import UIKit

extension UIDevice {
    var isIpad: Bool {
        return userInterfaceIdiom == .pad
    }

    var isIphone: Bool {
        return userInterfaceIdiom == .phone
    }
}
