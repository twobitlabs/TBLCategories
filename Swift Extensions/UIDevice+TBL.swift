
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

    var isIphoneX: Bool {
        return isIphone && (UIScreen.main.bounds.size.height == 812 || UIScreen.main.bounds.size.width == 812)
    }
    
    var isMacCatalyst: Bool {
        #if targetEnvironment(macCatalyst)
        return true
        #else
        return false
        #endif
    }
}
