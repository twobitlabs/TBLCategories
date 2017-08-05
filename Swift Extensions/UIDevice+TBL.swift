
import UIKit

extension UIDevice {
    var isIpad: Bool {
        return userInterfaceIdiom == .pad
    }

    var isIpadPro12: Bool {
        return isIpad && (UIScreen.main.bounds.size.height == 1366 || UIScreen.main.bounds.size.width == 1366)
    }

    var isIphone: Bool {
        return userInterfaceIdiom == .phone
    }
}
