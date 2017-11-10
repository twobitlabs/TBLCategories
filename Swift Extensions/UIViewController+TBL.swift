
import UIKit

typealias SimpleBlock = () -> Void

@objc extension UIViewController {
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

    func showRetryAlert(title: String, message: String? = nil, cancel: SimpleBlock?, retry: SimpleBlock?) {
        var actions = [
            UIAlertAction(title: .localized("Cancel"), style: .default, handler: { (alert: UIAlertAction) in
                cancel?()
            })
        ]
        if let retry = retry {
            actions.append(UIAlertAction(title: .localized("Retry"), style: .default, handler: { (alert: UIAlertAction) in
                retry()
            }))
        }
        showAlert(title: title, message: message, actions: actions)
    }

}
