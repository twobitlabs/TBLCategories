
import UIKit

extension UIFont {

    public enum UIFontTextStyle {
        case Headline
        case Subheadline
        case Body
        case Footnote
        case Caption1
        case Caption2

        private var style: String {
            switch self {
            case Headline:
                return UIFontTextStyleHeadline
            case Subheadline:
                return UIFontTextStyleSubheadline
            case Body:
                return UIFontTextStyleBody
            case Footnote:
                return UIFontTextStyleFootnote
            case Caption1:
                return UIFontTextStyleCaption1
            case Caption2:
                return UIFontTextStyleCaption2
            }
        }
    }

    public func preferredFontForTextStyle(style: UIFontTextStyle, sizeOffset: CGFloat = 0) -> UIFont {
        let descriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(style.style)
        return self.fontWithSize(descriptor.pointSize + sizeOffset)
    }

}