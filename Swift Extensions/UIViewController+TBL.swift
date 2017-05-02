
import UIKit

extension UIViewController {
    public func dismissAlertIfNecessary() {
        if presentedViewController is UIAlertController {
            dismiss(animated: false, completion: nil)
        }
    }

    public func showAlert(title: String, message: String? = nil, actions: [UIAlertAction]? = nil)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        if actions == nil || actions!.isEmpty {
            alert.addAction(UIAlertAction(title: String.localized("OK"), style: UIAlertActionStyle.default, handler: nil))
        } else {
            for action in actions! {
                alert.addAction(action)
            }
        }
        present(alert, animated: true, completion: nil)
    }
}
