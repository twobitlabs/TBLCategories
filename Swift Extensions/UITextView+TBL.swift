
import UIKit

extension UITextView {

    public class func selectableTextView() -> UITextView {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isSelectable = true
        textView.isEditable = false
        textView.backgroundColor = UIColor.clear
        textView.textContainerInset = UIEdgeInsets.zero

        return textView
    }

}
