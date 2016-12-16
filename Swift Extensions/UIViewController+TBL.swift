
import UIKit

extension UIViewController {
    public func dismissAlertIfNecessary() {
        if presentedViewController is UIAlertController {
            dismissViewControllerAnimated(false, completion: nil)
        }
    }

    public func showAlert(title: String, message: String? = nil, actions: [UIAlertAction]? = nil)  {
        let alert = LoggingAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        if actions == nil || actions!.isEmpty {
            alert.addAction(UIAlertAction(title: String.localized("OK"), style: UIAlertActionStyle.Default, handler: nil))
        } else {
            for action in actions! {
                alert.addAction(action)
            }
        }
        presentViewController(alert, animated: true, completion: nil)
    }
}
