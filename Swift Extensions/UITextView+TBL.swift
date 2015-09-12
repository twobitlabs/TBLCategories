
import UIKit

extension UITextView {

    public class func selectableTextView() -> UITextView {
        let textView = UITextView()
        textView.scrollEnabled = false
        textView.selectable = true
        textView.editable = false
        textView.backgroundColor = UIColor.clearColor()
        textView.textContainerInset = UIEdgeInsetsZero

        return textView
    }

}