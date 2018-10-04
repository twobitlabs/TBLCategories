
import UIKit

extension UIFont {

    public enum FontTextStyle {
        case Headline
        case Subheadline
        case Body
        case Footnote
        case Caption1
        case Caption2

        fileprivate var style: UIFont.TextStyle {
            switch self {
            case .Headline:
                return UIFont.TextStyle.headline
            case .Subheadline:
                return UIFont.TextStyle.subheadline
            case .Body:
                return UIFont.TextStyle.body
            case .Footnote:
                return UIFont.TextStyle.footnote
            case .Caption1:
                return UIFont.TextStyle.caption1
            case .Caption2:
                return UIFont.TextStyle.caption2
            }
        }
    }

    public func preferredFontForTextStyle(style: FontTextStyle, sizeOffset: CGFloat = 0) -> UIFont {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style.style)
        return self.withSize(descriptor.pointSize + sizeOffset)
    }

}
