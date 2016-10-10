
import UIKit

extension UIFont {

    public enum FontTextStyle {
        case Headline
        case Subheadline
        case Body
        case Footnote
        case Caption1
        case Caption2

        fileprivate var style: UIFontTextStyle {
            switch self {
            case .Headline:
                return UIFontTextStyle.headline
            case .Subheadline:
                return UIFontTextStyle.subheadline
            case .Body:
                return UIFontTextStyle.body
            case .Footnote:
                return UIFontTextStyle.footnote
            case .Caption1:
                return UIFontTextStyle.caption1
            case .Caption2:
                return UIFontTextStyle.caption2
            }
        }
    }

    public func preferredFontForTextStyle(style: FontTextStyle, sizeOffset: CGFloat = 0) -> UIFont {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style.style)
        return self.withSize(descriptor.pointSize + sizeOffset)
    }

}
